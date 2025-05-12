{
    "file": "osemosys.gms",
    "name": "osemosys",
    "nodes": [
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Data/italy_data.gms",
            "name": "italy_data.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_italy/init.gms",
            "name": "init.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_italy/input_demand.gms",
            "name": "input_demand.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_italy/input_primary.gms",
            "name": "input_primary.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_italy/input_secondary.gms",
            "name": "input_secondary.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_italy/input_storage.gms",
            "name": "input_storage.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_template/init.gms",
            "name": "init.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_template/input_demand.gms",
            "name": "input_demand.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_template/input_primary.gms",
            "name": "input_primary.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_template/input_secondary.gms",
            "name": "input_secondary.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Input_template/input_storage.gms",
            "name": "input_storage.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Model/compute_data.gms",
            "name": "compute_data.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Model/osemosys_equ.gms",
            "name": "osemosys_equ.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Model/osemosys_init.gms",
            "name": "osemosys_init.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Model/osemosys_res.gms",
            "name": "osemosys_res.gms",
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Results/results_SCENctaxchanging_DATAitaly_base_STORyes.gdx",
            "name": "results_SCENctaxchanging_DATAitaly_base_STORyes.gdx",
            "type": "gdx"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Results/results_SCENctaxchanging_DATAitaly_NCLMD2_STORyes.gdx",
            "name": "results_SCENctaxchanging_DATAitaly_NCLMD2_STORyes.gdx",
            "type": "gdx"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "Results/results_SCENctaxchanging_DATAitaly_NCMMD2_STORyes.gdx",
            "name": "results_SCENctaxchanging_DATAitaly_NCMMD2_STORyes.gdx",
            "type": "gdx"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "osemosys.gms",
            "name": "osemosys.gms",
            "options": [
                "--data = utopia",
                "--data = italyTry",
                "--data = template --solvermode = mip",
                "--data = template",
                "--data = italy",
                "--data = italy --solvermode = mip --scen = ctax --value = 100",
                "--data = italy --solvermode = mip --scen = ctax",
                "",
                "--data = italy --solvermode = mip"
            ],
            "type": "gms"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "osemosys.lst",
            "name": "osemosys.lst",
            "type": "lst"
        },
        {
            "codecMib": 106,
            "encoding": "UTF-8",
            "file": "SelResults.CSV",
            "name": "SelResults.CSV",
            "type": ""
        }
    ],
    "options": [
        "--data = utopia",
        "--data = italyTry",
        "--data = template --solvermode = mip",
        "--data = template",
        "--data = italy",
        "--data = italy --solvermode = mip --scen = ctax --value = 100",
        "--data = italy --solvermode = mip --scen = ctax",
        "",
        "--data = italy --solvermode = mip"
    ],
    "path": ".",
    "pf": "",
    "projectType": 1,
    "workDir": "."
}
