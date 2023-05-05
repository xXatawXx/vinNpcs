---------------------------
    --Shared Configs --
---------------------------
Config = {}
Config.useTargetTracking = true
NPCData = {
    [0] = {
        modelHash = "a_m_m_golfer_01",
        polygonHash = {`a_m_y_business_01`},
        coords = {
            ["x"] = -627.58,
            ["y"] = -274.96, 
            ["z"] = 35.58, 
            ["h"] = 122.88
        },
        {
            options = {
                {
                    event = "testthisevent",
                    icon = "far fa-clipboard",
                    label = "business man"
                },
            },
            job = {"all"},
            distance = 2.5,
        },
        scenario = "WORLD_HUMAN_CLIPBOARD",
    },

    [1] = {
        modelHash = "s_f_y_cop_01",
        polygonHash = {`s_f_y_cop_01`},
        coords = {
            ["x"] = 126.9,
            ["y"] = -1715.95, 
            ["z"] = 29.06, 
            ["h"] = 141.78
        },
        {
            options = {
                {
                    event = "testthisevent",
                    icon = "far fa-clipboard",
                    label = "cop lady"
                },
            },
            job = {"all"},
            distance = 2.5,
        },
        scenario = "WORLD_HUMAN_PARTYING",
    }
}