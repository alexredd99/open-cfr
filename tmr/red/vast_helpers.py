import itertools
import pyverilog.vparser.ast as vast

def NEW_BROADCAST_CONCAT_ASSIGN(ids_l: list, id_r: str):   
  concat_list = [vast.Identifier(x) for x in ids_l]

  return vast.Assign(
    vast.Lvalue(
      vast.LConcat(concat_list)),
    vast.Rvalue(
      vast.Repeat(
        vast.Concat([vast.Identifier(id_r)]),
        vast.IntConst(f'{len(concat_list)}'))))

def GEN_MULTI_OP(op, ids: list):
  if len(ids) % 2 != 0:
    last = ids[-1]
    pairs = ids[:-1]
  else:
    last = None
    pairs = ids
  while len(pairs) > 1:
    if len(pairs) % 2 != 0: 
      pairs.append(last)
      last = None
    pairs = [op(pairs[i], pairs[i+1]) for i in range(0, len(pairs), 2)]
  
  if last is not None: return op(last, pairs[0])
  else:                return pairs[0]

def GEN_VOTING(id_l: str, ids_r: list):
  combs = list(itertools.combinations(ids_r, 2))
  ands = [vast.And(vast.Identifier(x[0]), vast.Identifier(x[1])) for x in combs]

  return vast.Assign(
    vast.Lvalue(
      vast.Identifier(id_l)),
      vast.Rvalue(
        GEN_MULTI_OP(vast.Or, ands)))

def split_list(id_pairs: list, target):
  found = []
  not_found = []
  for pair in id_pairs:
    if target in pair: found.append(pair)
    else:              not_found.append(pair)

  return found, not_found

def GEN_DETECTION(ids: list, target):
  combs = list(itertools.combinations(ids, 2))
  target_pairs, other_pairs = split_list(combs, target)
  
  target_pairs = [vast.Xor(vast.Identifier(x[0]), vast.Identifier(x[1])) for x in target_pairs]

  other_pairs = [vast.Xor(vast.Identifier(x[0]), vast.Identifier(x[1])) for x in other_pairs]
  other_pairs = [vast.Unot(x) for x in other_pairs]

  if len(other_pairs) > 1: other_pairs = GEN_MULTI_OP(vast.And, other_pairs)
  else:                    other_pairs = other_pairs[0]
  return vast.And(GEN_MULTI_OP(vast.And, target_pairs), other_pairs)