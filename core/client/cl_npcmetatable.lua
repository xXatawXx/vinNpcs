NPC = {}

function NPC:createData(npcData)
    local this = {}
    this.active = false
    this.data = npcData
    self.__index = self
    return setmetatable(this, self)
end

function NPC:enableThread()
    if self.active then return end
    self.active = true
    CreateThread(function()
        while self.active do
            self.data = GenerateNPCs(self.data)
        end
        Wait(500)
    end)
end

function NPC:disableThread()
    if not self.active then return end
    self.active = false
end