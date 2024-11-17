local Project = {}

-- Game base resolution
Project.GameWidth = 1280
Project.GameHeight = 720

-- Window base resolution
Project.WindowWidth = 1280
Project.WindowHeight = 720

-- love.conf configurations
Project.Title = "Love2d Template"
Project.Company = "Company"
Project.CodeName = "L2dTemp"
Project.Identity = Project.Company .. "-" .. Project.CodeName

Project.WindowResizable = true
Project.VSync = 0 -- 0 = off, 1 = on

Project.Version = "11.5.0"

return Project