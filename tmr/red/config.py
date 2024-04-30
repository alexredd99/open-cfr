import yaml
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
from .logic import RedConfigGenerator, RedDataGenerator

def generate_from_yaml(file_path: str):
  with open(file_path) as config_file:
    # TODO: put in try/except block?
    yaml_config = yaml.safe_load(config_file) 
  
  # hard code for now
  # TODO: Change
  ip_config     = yaml_config["dart"]["partitions"][0]["hw_ips"][0]
  port_config   = ip_config["ports"]
  num_redundant = ip_config.get("num_redundant", 3) # default to 3

  sub_config = port_config['config']
  man_config = port_config['data']

  sub = RedConfigGenerator(
    num_redundant = num_redundant,
    data_width    = sub_config["data_width"],
    addr_width    = sub_config["addr_width"]
  )

  man = RedDataGenerator(
    num_redundant = num_redundant,
    id_width      = man_config["id_width"],
    awuser_width  = man_config["awuser_width"],
    aruser_width  = man_config["aruser_width"],
    wuser_width   = man_config["wuser_width"],
    ruser_width   = man_config["ruser_width"],
    buser_width   = man_config["buser_width"],
    data_width    = man_config["data_width"],
    addr_width    = man_config["addr_width"],
    interrupts    = man_config["interrupts"]
  )

  params  = sub.gen_paramlist()
  ports   = sub.gen_portlist()
  items   = sub.gen_logic()
  ast     = vast.ModuleDef("TMR_CONFIG", params, ports, items)
  codegen = ASTCodeGenerator()
  rslt    = codegen.visit(ast)
  #print(rslt)
  with open("config_top.v", "w") as conf_file:
    conf_file.write(rslt)

  params  = man.gen_paramlist()
  ports   = man.gen_portlist()
  items   = man.gen_logic()
  ast     = vast.ModuleDef("TMR_DATA", params, ports, items)
  codegen = ASTCodeGenerator()
  rslt    = codegen.visit(ast)
  #print(rslt)
  with open("data_top.v", "w") as data_file:
    data_file.write(rslt)