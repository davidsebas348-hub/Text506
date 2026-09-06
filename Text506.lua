-- ======================
-- SBS HUB COMPLETO FINAL
-- ======================

repeat task.wait() until game:IsLoaded()

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
screenGui.DisplayOrder = 999999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ======================
-- CONFIGURACIÓN DE COLORES Y NOMBRES
-- ======================

-- CAMBIAR NOMBRE DE LOS TITULOS DE LAS SECCIONES
local menuNames = {
    ["MAIN"] = "PLAYER MENU",
    ["ESP"] = "ESP",
    ["COMBATE"] = "FIGHT SYSTEM",
    ["AUTO"] = "M1",
    ["TELEPORT"] = "ETAPA",
    ["LABELS"] = "LABELS",
    ["FPS"] = "FPS",
    ["YOUTUBE"] = "YOUTUBE",
}

-- ======================
-- COLOR DE LOS TITULOS GRANDES
-- ======================

local menuTitleColors = {
    ["MAIN"] = Color3.fromRGB(255,255,255),
    ["ESP"] = Color3.fromRGB(0,255,255),
    ["COMBATE"] = Color3.fromRGB(255,0,0),
    ["AUTO"] = Color3.fromRGB(0,255,0),
    ["TELEPORT"] = Color3.fromRGB(0,170,255),
    ["LABELS"] = Color3.fromRGB(255,255,0),
    ["FPS"] = Color3.fromRGB(255,0,255),
    ["YOUTUBE"] = Color3.fromRGB(255,0,0),
}

-- ======================
-- COLOR DEL RELLENO DE LOS BOTONES IZQUIERDOS
-- ======================
-- SOLO cambia el RELLENO.
-- NO cambia los bordes.
-- El color se mantiene aunque selecciones el botón.

local leftMenuFillColors = {
    ["MAIN"] = Color3.fromRGB(255,255,0),
    ["ESP"] = Color3.fromRGB(0,255,255),
    ["COMBATE"] = Color3.fromRGB(255,0,0),
    ["AUTO"] = Color3.fromRGB(0,255,0),
    ["TELEPORT"] = Color3.fromRGB(0,170,255),
    ["LABELS"] = Color3.fromRGB(255,255,0),
    ["FPS"] = Color3.fromRGB(255,0,255),
    ["YOUTUBE"] = Color3.fromRGB(255,0,0),
}

-- ======================
-- COLOR DEL TEXTO DE LOS BOTONES DERECHOS
-- ======================
-- Escribe el nombre EXACTO del botón.

local rightButtonTextColors = {
    ["SPEED"] = Color3.fromRGB(255,255,0),
    ["JUMPPOWER"] = Color3.fromRGB(0,255,255),
    ["GRAVITY"] = Color3.fromRGB(255,100,100),
    ["FLY"] = Color3.fromRGB(0,255,0),
    ["LOCALPLAYER"] = Color3.fromRGB(255,0,255),

    -- EJEMPLOS:
    -- ["NOCLIP"] = Color3.fromRGB(255,255,255),
    -- ["RESET STATS"] = Color3.fromRGB(255,0,0),
}

-- ======================
-- DESCRIPCIONES
-- ======================
-- Pon el nombre del botón o TextBox.
-- El texto aparece DEBAJO.
--
-- Si es corto ocupa 1 renglón.
-- Si es largo ocupa 2 o más automáticamente.

local buttonDescriptions = {

    ["SPEED"] =
        "Cambia la velocidad del jugador.",

    ["JUMPPOWER"] =
        "Cambia la fuerza con la que salta el jugador.",

    ["GRAVITY"] =
        "Modifica la gravedad del jugador.",

    ["FLY SPEED"] =
        "Cambia la velocidad de movimiento cuando estás volando.",

    ["FLY"] =
        "Activa el vuelo del jugador.",

    ["INVISIBLE"] =
        "Hace que tu personaje sea invisible.",

    ["NOCLIP"] =
        "Permite atravesar paredes y otros objetos.",

    ["LOCALPLAYER"] =
        "Modifica las opciones relacionadas con tu jugador.",

    ["ESP ULTI"] =
        "Muestra información visual relacionada con la habilidad.",

    ["RESET STATS"] =
        "Restablece las estadísticas modificadas del jugador.",

    -- EJEMPLOS:
    -- ["POWER"] =
    --     "Cambia la fuerza utilizada por esta función.",
}

-- ======================
-- NUMERIC TEXTBOX
-- ======================

local numericBoxes = {
    ["SPEED"] = true,
    ["JUMPPOWER"] = true,
    ["GRAVITY"] = true,
    ["RANGE"] = true,
    ["SIZE"] = true,
    ["FLY SPEED"] = true,
    ["TRASPARENCY 0-1"] = true,
    ["FOV SIZE"] = true,
    ["BULLET SIZE"] = true,
    ["1 = 20"] = true,
    ["VELOCIDAD DE EL DISPARO"] = true,
    ["DAÑO DE EL DISPARO"] = true,
    ["ESCRIBE EL VALOR QUE QUIERES TENER"] = true,
    ["DAÑO"] = true,
    ["DAÑO EN BLOQUEO"] = true,
    ["FUERZA"] = true,
    ["GANANCIA PARA LA ESPECIAL"] = true,
    ["COOLDOWN DE LA ESPECIAL"] = true,
    ["CHANCE DE LA PASIVA"] = true,
}

-- ======================
-- DOUBLE BUTTONS
-- ======================

local doubleButtons = {
    ["AUTO ACAR VOLANDO"] = "NOMBRE DE EL JUGADO",
    ["PLAYER NAME"] = "TP TO PLAYER"
}

-- ======================
-- TITULOS ARRIBA
-- ======================

local topTitles = {
    ["ACTIVAR MODFICACIÓN"] = "MODIFICAR TOOLS",
    ["TP T"] = "TELEPORT",
    ["AUTO GANAR EN LA HABILIDAD Juicio Final"] = "GANAR",
    ["SPEED"] = "PLAYER",
}

-- ======================
-- TITULOS ABAJO
-- ======================

local customTitles = {
    ["SPED"] = "MOVEMENT SETTINGS",
    ["TRSPARENCY 0-1"] = "OP",
    ["ESP NAE"] = "ESP VISUAL",
}

-- ======================
-- MULTI BUTTON CONFIG
-- ======================

local multiButtons = {

    [""] = {
        options = {

            {
                name = "MODE: BLE",
                variable = "OnlyVisie",
                color = Color3.fromRGB(0,255,0)
            },

            {
                name = "MODE: NO VISIBLE",
                variable = "aim_torso",
                color = Color3.fromRGB(255,0,0)
            }

        }
    },

    ["MODE: NO EQUIPPED KNIFE"] = {
        options = {

            {
                name = "MODE: ONLY EQUIPPED KNIFE",
                variable = "ONLY_EQUIPPED_KNIFE",
                color = Color3.fromRGB(0,255,0)
            },

            {
                name = "MODE: NO EQUIPPED KNIFE",
                variable = "NOU",
                color = Color3.fromRGB(255,0,0)
            }

        }
    },

    ["ESP COLOR"] = {
        options = {

            {
                name = "BLACK",
                variable = "esp_black",
                color = Color3.fromRGB(0,0,0)
            },

            {
                name = "RED",
                variable = "esp_red",
                color = Color3.fromRGB(255,0,0)
            },

            {
                name = "BLUE",
                variable = "esp_blue",
                color = Color3.fromRGB(0,100,255)
            }

        }
    }
}

-- ======================
-- CONFIG GLOBAL BOTONES
-- ======================

local BUTTON_SIZE =
    UDim2.new(1,-20,0,30)

local BUTTON_OFFSET_X = 10
local BUTTON_GLOBAL_X = 0
local BUTTON_GLOBAL_Y = 0

-- ======================
-- CONFIG PERSONAL POR BOTON
-- ======================

local BUTTON_CUSTOM = {

    ["DELAY"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["NOMBRE DE EL JUGAD"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["POWER"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["COLOR OF THE ESP"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["BULLET SIZE."] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["TRASPARENCY 0-"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -9
    }
}

-- ======================
-- TITULOS ARRIBA DE BOTONES
-- ======================

local buttonTitles = {

    ["AUTO DISPARAR (EQUIPAR MINIGUN"] = "ARMA",
    ["KILL AURA (EQUIPAR BATON)"] = "BATON",
    ["JUMP(BUTTON)"] = "JUMP PAD",
    ["EXPANDIR HITBOX"] = "HITBOX",

    ["ACTIVAR CONFIGURACIÓN"] = "CONFIGURAR TOOLS",
    ["AUTO RECOLECTAR DINERO (RAPIDO)"] = "RECOLECCIÓN",

    ["TP A MUNDO 2"] = "MUNDOS",
    ["TP TOOL"] = "CLICK",
    ["NOMBRE DE EL JUGADOR"] = "JUGADORES",

    ["AUTO SACAR VOLANDO A TODOS"] = "FLING",
    ["AUTO MATAR A TODOS"] = "KILL",
    ["LAG SERVER (EQUIPAR BOMBA)"] = "SERVER",

    ["PLAYER NA"] = "FLING",
    ["TOUCH FLING"] = "TOUCH",
    ["ESP ENEMIES"] = "ENEMIES",
    ["ESP PLAYERS + NAME + DISTANCE"] = "PLAYERS",

    ["AUTO EAT"] = "EAT",
    ["SELF-HEALING"] = "HEALTH",
    [""] = "ENEMIES",

    ["AUTO KILL ENEMIES"] = "KILL",
    ["MULTIPLY DAMAGE"] = "DAMAGE MULTIPLIER",
    ["INFINITY AMMO"] = "MODIFY GUNS",
    ["INSTANT SWING"] = "MESH WEAPON MODIFICATIONS",

    ["NAME OF THE ITEM"] = "BRING",
    ["NAME OF THE ITEM."] = "GRAB",

    ["Fps Boost"] = "PERFORMANCE"
}

-- ======================
-- TOGGLE V2
-- ======================

local redToggleButtons = {
    ["X-RAY"] = true,
    ["BULLET TRACERS"] = true,
}

getgenv().SBS_BUTTON_STATES =
    getgenv().SBS_BUTTON_STATES or {}

local buttonStates =
    getgenv().SBS_BUTTON_STATES

-- ======================
-- NO TOGGLE
-- ======================

local noToggleButtons = {

    ["YOUTUBE:SBS HUB"] = true,
    ["SUSCRIBETE:)"] = true,
    ["OBTENER TODAS LAS TOOLS"] = true,
    ["LOCALPLAYER"] = true,
    ["RESET STATS"] = true,
    ["DESNC"] = true,
    ["Fps Boost"] = true,
    ["REVIVIR"] = true,
    ["AUTO FARMEAR DINERO"] = true,
    ["ESTAR EN LA ETAPA 99.900M"] = true,
    ["COMPLETAR OBBY"] = true,
    ["SER GUARDIA"] = true,
    ["SER PRISIONERO"] = true,
    ["PARAR EL TIEMPO"] = true,
    ["TP A MUNDO 2"] = true,
    ["OBTENER SHIFTLOCK"] = true,
    ["TP A JUGADOR"] = true,
    ["MULTI SALTOS INFINITOS"] = true,
    ["SEMI-INMUNE"] = true,
    ["AUTO COMPLETAR"] = true,
    ["TP TO PLAYER"] = true,
    ["FLING PLAYER"] = true,
    ["OBTENER 999 DE SALTOS"] = true,
    ["SALTAR TODO"] = true,
    ["OBTENER SKIPS (Saltos)"] = true,
}

-- ======================
-- NO GREEN FLASH
-- ======================

local noGreenFlash = {
    ["SUSCRIBETE:)"] = true
}

-- ======================
-- TEXTBOX BUTTONS
-- ======================

local textboxButtons = {

    ["SPEED"] = {
        variable = "SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Speed/refs/heads/main/Speed.lua"
    },

    ["BULLET SPEED"] = {
        variable = "BULLET_SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text397/refs/heads/main/Text397.lua"
    },

    ["BULLETSPERSHOT"] = {
        variable = "BULLETS_PER_SHOT",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text398/refs/heads/main/Text398.lua"
    },

    ["JUMPPOWER"] = {
        variable = "JUMP",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/JumpPower/refs/heads/main/JumpPower.lua"
    },

    ["GRAVITY"] = {
        variable = "GRAVITY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Gravity/refs/heads/main/Gravity.lua"
    },

    ["ESCRIBE LA ETAPA QUE QUIERAS IR"] = {
        variable = "StageNumber",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
    },

    ["FLY SPEED"] = {
        variable = "FLY_SPEED",
        url = nil
    },

    ["TAMAÑO"] = {
        variable = "HITBOX_SIZE",
        url = nil
    },

    ["TRANSPARENCIA 0-1"] = {
        variable = "HITBOX_TRANSPARENCY",
        url = nil
    },

    ["NOMBRE DE EL JUGADOR"] = {
        variable = "PLAYER",
        url = nil
    },

    ["ESCRIBE EL VALOR QUE QUIERES TENER"] = {
        variable = "Veces",
        url = nil
    },

    ["TIEMPO DE RECARGA"] = {
        variable = "FoodZookaSettings.ReloadTime",
        url = nil
    },

    ["FUERZA DE EL DISPARO"] = {
        variable = "FoodZookaSettings.Force",
        url = nil
    },

    ["VELOCIDAD DE EL DISPARO"] = {
        variable = "FoodZookaSettings.BulletSpeed",
        url = nil
    },

    ["NOMBRE DE EL JUGADOR_"] = {
        variable = "TargetPlayer2",
        url = nil
    },

    ["DAÑO DE EL DISPARO"] = {
        variable = "FoodZookaSettings.Damage",
        url = nil
    },

    ["DAÑO"] = {
        variable = "Damage",
        url = nil
    },

    ["DAÑO POR DEFECTO"] = {
        variable = "DefaultDamage",
        url = nil
    },

    ["DAÑO EN BLOQUEO"] = {
        variable = "BlockDamage",
        url = nil
    },

    ["FUERZA"] = {
        variable = "Force",
        url = nil
    },

    ["CHANCE DE LA PASIVA"] = {
        variable = "PassivaChance",
        url = nil
    },

    ["DISTANCIA DE LA DETECCIÓN DE M1"] = {
        variable = "Distance",
        url = nil
    },

    ["DISTANCIA DE LA DETECCIÓN DEL M1"] = {
        variable = "AUTO_F_DISTANCE",
        url = nil
    },

    ["GANANCIA PARA LA ESPECIAL"] = {
        variable = "SpecialBuildup",
        url = nil
    },

    ["COOLDOWN DE LA ESPECIAL"] = {
        variable = "SpecialCooldown",
        url = nil
    },

    ["PLAYER NAME."] = {
        variable = "TargetPlayerName",
        url = nil
    },

    ["FOV SIZE"] = {
        variable = "AIMBOT_FOV",
        url = nil
    },

    ["RANGO"] = {
        variable = "HitRadius",
        url = nil
    },

    ["XRAY-TRANSPARENCY"] = {
        variable = "XRAY_TRANSPARENCY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text433/refs/heads/main/Text433.lua"
    },

    ["1 = 20"] = {
        variable = "Timer",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text343/refs/heads/main/Text343.lua"
    },

    ["POWER"] = {
        variable = "TouchFlingForce",
        url = nil
    }
}

-- ======================
-- ELIMINAR GUI ANTERIOR
-- ======================

local old =
    PlayerGui:FindFirstChild("SBS_HUB")

if old then
    old:Destroy()
end

screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false

-- ======================
-- MAIN FRAME
-- ======================

local mainFrame =
    Instance.new("Frame",screenGui)

mainFrame.Size =
    UDim2.new(0,500,0,350)

mainFrame.Position =
    UDim2.new(0.5,-250,0.5,-175)

mainFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false

-- ======================
-- RESIZE CORNER
-- ======================

local resizeCorner =
    Instance.new("Frame",mainFrame)

resizeCorner.Size =
    UDim2.new(0,20,0,20)

resizeCorner.Position =
    UDim2.new(1,-20,1,-20)

resizeCorner.BackgroundTransparency = 0.5

resizeCorner.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

resizeCorner.BorderSizePixel = 0
resizeCorner.ZIndex = 10

-- ======================
-- RESIZE LOGIC
-- ======================

do

    local dragging
    local dragStart
    local startSize

    local function updateSize(input)

        local delta =
            input.Position - dragStart

        local newWidth =
            math.max(
                100,
                startSize.X + delta.X
            )

        local newHeight =
            math.max(
                100,
                startSize.Y + delta.Y
            )

        mainFrame.Size =
            UDim2.new(
                0,
                newWidth,
                0,
                newHeight
            )
    end

    resizeCorner.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startSize =
                Vector2.new(
                    mainFrame.AbsoluteSize.X,
                    mainFrame.AbsoluteSize.Y
                )

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)

        if dragging
        and (
            input.UserInputType ==
                Enum.UserInputType.MouseMovement
            or input.UserInputType ==
                Enum.UserInputType.Touch
        ) then

            updateSize(input)
        end
    end)
end

-- ======================
-- STROKE
-- ======================

local stroke =
    Instance.new("UIStroke",mainFrame)

stroke.Color =
    Color3.fromRGB(255,255,255)

stroke.Thickness = 2

-- ======================
-- DRAG MAIN FRAME
-- ======================

do

    local dragging
    local dragStart
    local startPos
    local dragInput

    local function update(input)

        local delta =
            input.Position - dragStart

        mainFrame.Position =
            UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
    end

    mainFrame.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startPos =
                mainFrame.Position

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false
                end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)

        if input == dragInput
        and dragging then

            update(input)
        end
    end)
end

-- ======================
-- TITULO PRINCIPAL
-- ======================

local title =
    Instance.new("TextLabel",mainFrame)

title.Size =
    UDim2.new(1,0,0,50)

title.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

title.Text =
    "SBS HUB | HYPER SPEED RUNNER"

title.TextColor3 =
    Color3.fromRGB(255,255,255)

title.Font =
    Enum.Font.GothamBold

title.TextScaled = true

-- ======================
-- LINEA
-- ======================

local line =
    Instance.new("Frame",mainFrame)

line.Size =
    UDim2.new(1,0,0,2)

line.Position =
    UDim2.new(0,0,0,50)

line.BackgroundColor3 =
    Color3.new(1,1,1)

line.BackgroundTransparency = 0

-- ======================
-- RIGHT FRAME
-- ======================

local rightFrame =
    Instance.new("ScrollingFrame",mainFrame)

rightFrame.Size =
    UDim2.new(1,-150,1,-52)

rightFrame.Position =
    UDim2.new(0,150,0,52)

rightFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

rightFrame.BorderSizePixel = 0

-- ======================
-- LEFT FRAME
-- ======================

local leftFrame =
    Instance.new("ScrollingFrame",mainFrame)

leftFrame.Size =
    UDim2.new(0,150,1,-52)

leftFrame.Position =
    UDim2.new(0,0,0,52)

leftFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

leftFrame.BorderSizePixel = 0

leftFrame.ScrollBarThickness = 6

leftFrame.AutomaticCanvasSize =
    Enum.AutomaticSize.Y

-- ======================
-- PADDING
-- ======================

local padding =
    Instance.new("UIPadding",rightFrame)

padding.PaddingBottom =
    UDim.new(0,50)

-- ======================
-- LINEA CENTRAL
-- ======================

local midLine =
    Instance.new("Frame",mainFrame)

midLine.Size =
    UDim2.new(0,2,1,-52)

midLine.Position =
    UDim2.new(0,150,0,52)

midLine.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

-- ======================
-- EMERGENCY DRAG LINE
-- ======================

local dragLine =
    Instance.new("Frame",mainFrame)

dragLine.Size =
    UDim2.new(1,-60,0,8)

dragLine.Position =
    UDim2.new(0,30,1,10)

dragLine.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

dragLine.BackgroundTransparency = 0.7

dragLine.BorderSizePixel = 0
dragLine.ZIndex = 20

local dragCorner =
    Instance.new("UICorner",dragLine)

dragCorner.CornerRadius =
    UDim.new(0,6)

-- ======================
-- DRAG LINE
-- ======================

do

    local dragging
    local dragStart
    local startPos

    local function update(input)

        local delta =
            input.Position - dragStart

        mainFrame.Position =
            UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
    end

    dragLine.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startPos =
                mainFrame.Position

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)

        if dragging
        and (
            input.UserInputType ==
                Enum.UserInputType.MouseMovement
            or input.UserInputType ==
                Enum.UserInputType.Touch
        ) then

            update(input)
        end
    end)
end

-- ======================
-- CREAR BOTON IZQUIERDO
-- ======================

local currentMenuButton = nil

local function createMenuButton(
    parent,
    text,
    y,
    callback
)

    local b =
        Instance.new("TextButton",parent)

    b.Size =
        UDim2.new(1,-20,0,30)

    b.Position =
        UDim2.new(0,10,0,y)

    b.Text = text

    -- RELLENO PERSONALIZADO
    b.BackgroundColor3 =
        leftMenuFillColors[text]
        or Color3.fromRGB(15,15,15)

    b.TextColor3 =
        Color3.fromRGB(255,255,255)

    b.Font =
        Enum.Font.GothamBold

    b.TextSize = 14

    -- SIN BORDE
    b.BorderSizePixel = 0

    b.MouseButton1Click:Connect(function()

        -- RESTAURAR BOTON ANTERIOR
        if currentMenuButton
        and currentMenuButton ~= b then

            currentMenuButton.BackgroundColor3 =
                leftMenuFillColors[
                    currentMenuButton.Text
                ]
                or Color3.fromRGB(15,15,15)

            currentMenuButton.TextColor3 =
                Color3.fromRGB(255,255,255)
        end

        -- MANTENER COLOR PERSONALIZADO
        b.BackgroundColor3 =
            leftMenuFillColors[text]
            or Color3.fromRGB(255,255,255)

        b.TextColor3 =
            Color3.fromRGB(0,0,0)

        currentMenuButton = b

        callback()
    end)
end

-- ======================
-- FUNCION PARA MEDIR DESCRIPCION
-- ======================

local function getDescriptionHeight(text,parent)

    if not text then
        return 0
    end

    local width =
        math.max(
            100,
            parent.AbsoluteSize.X - 40
        )

    local result =
        TextService:GetTextSize(
            text,
            12,
            Enum.Font.Gotham,
            Vector2.new(width,1000)
        )

    return math.max(18,result.Y) + 8
end

-- ======================
-- CREAR BOTON DERECHO
-- ======================

local function createButton(
    parent,
    text,
    y,
    callback
)

    local hasTextbox =
        textboxButtons[text] ~= nil

    local multiConfig =
        multiButtons[text]

    local container =
        Instance.new("Frame",parent)

    local custom =
        BUTTON_CUSTOM[text]

    local finalSize =
        BUTTON_SIZE

    local extraX = 0
    local extraY = 0

    if custom then

        if custom.size then
            finalSize =
                custom.size
        end

        extraX =
            custom.x or 0

        extraY =
            custom.y or 0
    end

    local isDoubleLeft =
        doubleButtons[text] ~= nil

    local isDoubleRight = false

    for left,right in pairs(doubleButtons) do

        if text == right then

            isDoubleRight = true

            break
        end
    end

    if isDoubleLeft then

        container.Size =
            UDim2.new(0.5,-15,0,30)

        container.Position =
            UDim2.new(0,10,0,y)

    elseif isDoubleRight then

        container.Size =
            UDim2.new(0.5,-15,0,30)

        container.Position =
            UDim2.new(0.5,5,0,y)

    else

        container.Size =
            finalSize

        container.Position =
            UDim2.new(
                0,
                10 + extraX,
                0,
                y + extraY
            )
    end

    container.BackgroundTransparency = 1

    -- ======================
    -- MULTI
    -- ======================

    if multiConfig then

        local button =
            Instance.new("TextButton",container)

        button.Size =
            UDim2.new(1,0,1,0)

        button.Text = ""

        button.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        button.TextColor3 =
            rightButtonTextColors[text]
            or Color3.fromRGB(255,255,255)

        button.Font =
            Enum.Font.GothamBold

        button.TextSize = 14

        button.BorderSizePixel = 0

        getgenv().SBS_MULTI =
            getgenv().SBS_MULTI or {}

        local index =
            getgenv().SBS_MULTI[text] or 0

        local options =
            multiConfig.options

        local label =
            Instance.new("TextLabel",button)

        label.Size =
            UDim2.new(1,0,1,0)

        label.BackgroundTransparency = 1

        label.TextSize = 14

        label.Font =
            Enum.Font.GothamBold

        local function update()

            if index == 0 then

                label.Text = text

                label.TextColor3 =
                    rightButtonTextColors[text]
                    or Color3.fromRGB(255,255,255)

            else

                local opt =
                    options[index]

                label.Text =
                    opt.name

                label.TextColor3 =
                    opt.color

                for _,option in ipairs(options) do

                    if option.name then
                        getgenv()[option.name] = nil
                    end

                end

                for _,option in ipairs(options) do

                    if option.variable then
                        getgenv()[option.variable] = false
                    end

                end

                if opt.variable then
                    getgenv()[opt.variable] = true
                end
            end
        end

        update()

        button.MouseButton1Click:Connect(function()

            index += 1

            if index > #options then
                index = 1
            end

            getgenv().SBS_MULTI[text] =
                index

            update()
        end)

        return
    end

    -- ======================
    -- TEXTBOX
    -- ======================

    if hasTextbox then

        local box =
            Instance.new("TextBox",container)

        box.Size =
            UDim2.new(1,0,1,0)

        box.BackgroundColor3 =
            Color3.fromRGB(25,25,25)

        box.TextColor3 =
            rightButtonTextColors[text]
            or Color3.fromRGB(255,255,255)

        box.PlaceholderText =
            text

        box.Text = ""

        box.Font =
            Enum.Font.GothamBold

        box.TextSize = 14

        box.BorderSizePixel = 0

        local data =
            textboxButtons[text]

        if data
        and getgenv()[data.variable] ~= nil then

            box.Text =
                tostring(
                    getgenv()[data.variable]
                )
        end

        box:GetPropertyChangedSignal(
            "Text"
        ):Connect(function()

            if numericBoxes[text] then

                box.Text =
                    box.Text:gsub(
                        "[^%d%.%-]",
                        ""
                    )
            end
        end)

        box.FocusLost:Connect(function()

            local input =
                box.Text

            if input == "" then
                return
            end

            local value

            if numericBoxes[text] then

                value =
                    tonumber(input)

                if not value then

                    box.Text =
                        tostring(
                            getgenv()[data.variable]
                            or ""
                        )

                    return
                end

            else

                value = input
            end

            if getgenv()[data.variable] ==
                value then

                return
            end

            getgenv()[data.variable] =
                value

            if data.url then

                loadstring(
                    game:HttpGet(data.url)
                )()
            end
        end)

        return
    end

    -- ======================
    -- BOTON NORMAL
    -- ======================

    local button =
        Instance.new("TextButton",container)

    button.Size =
        UDim2.new(1,0,1,0)

    button.TextColor3 =
        rightButtonTextColors[text]
        or Color3.fromRGB(255,255,255)

    button.Font =
        Enum.Font.GothamBold

    button.TextSize = 14

    button.BorderSizePixel = 0

    local isRedToggle =
        redToggleButtons[text]

    local isToggle =
        isRedToggle
        or not noToggleButtons[text]

    if isToggle then

        if buttonStates[text] == nil then
            buttonStates[text] = false
        end

        local function updateVisual()

            if isRedToggle then

                button.Text = text

                if buttonStates[text] then

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            120,0,0
                        )

                else

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            20,20,20
                        )
                end

            else

                if buttonStates[text] then

                    button.Text =
                        text.." [ON]"

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            0,120,0
                        )

                else

                    button.Text =
                        text.." [OFF]"

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            20,20,20
                        )
                end
            end

            -- Mantener color del texto
            button.TextColor3 =
                rightButtonTextColors[text]
                or Color3.fromRGB(255,255,255)
        end

        updateVisual()

        button.MouseButton1Click:Connect(function()

            buttonStates[text] =
                not buttonStates[text]

            updateVisual()

            callback(
                buttonStates[text]
            )
        end)

    else

        button.Text = text

        button.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        local clicking = false

        button.MouseButton1Click:Connect(function()

            if clicking then
                return
            end

            clicking = true

            if not noGreenFlash[text] then

                local oldColor =
                    button.BackgroundColor3

                button.BackgroundColor3 =
                    Color3.fromRGB(0,120,0)

                task.delay(
                    0.5,
                    function()

                        if button then

                            button.BackgroundColor3 =
                                oldColor
                        end

                        clicking = false
                    end
                )

            else

                clicking = false
            end

            if callback then
                callback()
            end
        end)
    end
end

-- ======================
-- SCROLL
-- ======================

local scrollConfig = {

    ["MAIN"] = true,
    ["ESP"] = true,
    ["COMBATE"] = true,
    ["AUTO"] = true,
    ["TELEPORT"] = true,
    ["LABELS"] = true,
    ["FPS"] = false,
    ["YOUTUBE"] = false
}

-- ======================
-- MENUS
-- ======================

local menuOrder = {

    "MAIN",
    "ESP",
    "COMBATE",
    "AUTO",
    "TELEPORT",
    "LABELS",
    "FPS"
}

local menuData = {

    ["MAIN"] = {

        "INVISIBLE",
        "DESYNC",
        "OBTENER SHIFTLOCK",
        "SPEED",
        "JUMPPOWER",
        "GRAVITY",
        "RESET STATS",
        "INFINITI JUMP",
        "NOCLIP",
        "FLY SPEED",
        "FLY",

    },

    ["ESP"] = {

        "ESP ULTI",

    },

    ["AUTO"] = {

        "AUTO RECOGER OBJETOS",
        "AUTO ABRIR PUERTAS",

    },

    ["GAMEPASS"] = {

        "MAS ESPACIO PARA EMOTES",
        "POWER",
        "PLAYER NAME.",
        "FLING PLAYER",

    },

    ["OP"] = {

        "GODMODE",

    },

    ["TELEPORT"] = {

        "TP TOOL",
        "NOMBRE DE EL JUGADOR",
        "TP A JUGADOR",

    },

    ["GANAR/SPEEDRUN"] = {

        "PARAR EL TIEMPO",
        "COMPLETAR OBBY",

    },

    ["COMBATE"] = {

        "AUTO WALLCOMBO",
        "CONTRATAQUE AUTOMÁTICO A M1",
        "DISTANCIA DE LA DETECCIÓN DE M1",
        "BLOQUEO AUTOMÁTICO A M1",
        "DISTANCIA DE LA DETECCIÓN DEL M1",

    },

    ["FARM"] = {

        "AUTO GANAR VICTORIAS (CHAPTER 1)",

    },

    ["TROLL"] = {

        "LAG SERVER (EQUIPAR BOMBA)",
        "AUTO SACAR VOLANDO A TODOS",
        "AUTO SACAR VOLANDO",
        "NOMBRE DE EL JUGADOR",
        "AUTO MATAR A TODOS",
        "AUTO MATAR",
        "NOMBRE DE EL JUGADOR_",

    },

    ["FPS"] = {

        "Fps Boost"

    },

    ["LABELS"] = {

        "CONTADOR DE PING",
        "CONTADOR DE FPS",

    },

    ["YOUTUBE"] = {

        "YOUTUBE:SBS HUB",
        "SUSCRIBETE:)"

    }
}

-- ======================
-- CLEAR FRAME
-- ======================

local function clearFrame(frame)

    for _,v in pairs(
        frame:GetChildren()
    ) do

        if not v:IsA("UIPadding") then

            if v:IsA("TextButton")
            or v:IsA("TextLabel")
            or v:IsA("TextBox")
            or v:IsA("Frame") then

                v:Destroy()
            end
        end
    end

    frame.CanvasPosition =
        Vector2.new(0,0)
end

-- ======================
-- CREAR MENUS
-- ======================

for i,menu in ipairs(menuOrder) do

    createMenuButton(
        leftFrame,
        menu,
        10+(i-1)*35,
        function()

            clearFrame(rightFrame)

            if scrollConfig[menu] then

                rightFrame.ScrollBarThickness = 6

                rightFrame.AutomaticCanvasSize =
                    Enum.AutomaticSize.Y

            else

                rightFrame.ScrollBarThickness = 0

                rightFrame.AutomaticCanvasSize =
                    Enum.AutomaticSize.None

                rightFrame.CanvasSize =
                    UDim2.new(0,0,0,0)
            end

            -- ======================
            -- TITULO DERECHO
            -- ======================

            local titleLabel =
                Instance.new(
                    "TextLabel",
                    rightFrame
                )

            titleLabel.Size =
                UDim2.new(1,0,0,30)

            titleLabel.BackgroundTransparency = 1

            titleLabel.Text =
                menuNames[menu] or menu

            titleLabel.TextColor3 =
                menuTitleColors[menu]
                or Color3.fromRGB(
                    255,255,255
                )

            titleLabel.Font =
                Enum.Font.GothamBold

            titleLabel.TextSize = 18

            local oy = 40

            for _,opt in ipairs(
                menuData[menu] or {}
            ) do

                -- ======================
                -- TITULO SIMPLE
                -- ======================

                if buttonTitles[opt] then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,0,25
                        )

                    section.Position =
                        UDim2.new(
                            0,10,0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        buttonTitles[opt]

                    section.TextColor3 =
                        Color3.fromRGB(
                            200,200,200
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 16

                    section.TextXAlignment =
                        Enum.TextXAlignment.Left

                    oy += 30
                end

                -- ======================
                -- TITULO ARRIBA
                -- ======================

                local topTitle =
                    topTitles[opt]

                if topTitle then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,0,0,30
                        )

                    section.Position =
                        UDim2.new(
                            0,0,0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        topTitle

                    section.TextColor3 =
                        Color3.fromRGB(
                            255,255,255
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 18

                    section.TextXAlignment =
                        Enum.TextXAlignment.Center

                    oy += 35
                end

                -- ======================
                -- CREAR BOTON
                -- ======================

                createButton(
                    rightFrame,
                    opt,
                    oy,
                    function(state)

                        if opt == "RESET STATS" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Reset-speed-jumpPower-y-gravedad-/refs/heads/main/Reset.lua"
                                )
                            )()

                        elseif opt == "AUTO WALLCOMBO" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text233/refs/heads/main/Text233.lua"
                                )
                            )()

                        elseif opt == "" then

                            getgenv().HIGHLIGHT_ME =
                                not getgenv().HIGHLIGHT_ME

                        elseif opt == "GODMODE" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text497/refs/heads/main/Text497.lua"
                                )
                            )()

                        elseif opt == "CONTRATAQUE AUTOMÁTICO A M1" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text502/refs/heads/main/Text502.lua"
                                )
                            )()

                        elseif opt == "ESP ULTI" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text503/refs/heads/main/Text503.lua"
                                )
                            )()

                        elseif opt == "CONTADOR DE PING" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Detector_ping/refs/heads/main/Ping.lua"
                                )
                            )()

                        elseif opt == "CONTADOR DE FPS" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Detectar_fps/refs/heads/main/Fps.lua"
                                )
                            )()

                        elseif opt == "BLOQUEO AUTOMÁTICO A M1" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text241/refs/heads/main/Text241.lua"
                                )
                            )()

                        elseif opt == "MAS ESPACIO PARA EMOTES" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text504/refs/heads/main/Text504.lua"
                                )
                            )()

                        elseif opt == "AUTO MATAR A TODOS" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text468/refs/heads/main/Text468.lua"
                                )
                            )()

                        elseif opt == "DESYNC" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text428/refs/heads/main/Text428.lua"
                                )
                            )()

                        elseif opt == "AUTO MATAR" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text469/refs/heads/main/Text469.lua"
                                )
                            )()

                        elseif opt == "LAG SERVER (EQUIPAR BOMBA)" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text470/refs/heads/main/Text470.lua"
                                )
                            )()

                        elseif opt == "ESTAR EN LA ETAPA 99.900M" then

                            getgenv().StageNumber =
                                99999000000

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
                                )
                            )()

                        elseif opt == "COMPLETAR OBBY" then

                            loadstring(
                                game:HttpGet(
                                    "https://github.com/davidsebas348-hub/Text479/blob/main/Text479.lua"
                                )
                            )()

                        elseif opt == "PARAR EL TIEMPO" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text471/refs/heads/main/Text471.lua"
                                )
                            )()

                        elseif opt == "SER GUARDIA" then

                            getgenv().StageNumber = 21

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
                                )
                            )()

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text67/refs/heads/main/Text67.lua"
                                )
                            )()

                        elseif opt == "SER PRISIONERO" then

                            getgenv().StageNumber = 1

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Reset_Player/refs/heads/main/Reset.lua"
                                )
                            )()

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
                                )
                            )()

                        elseif opt == "ESP A JUGADORES" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text473/refs/heads/main/Text473.lua"
                                )
                            )()

                        elseif opt == "ESP A BARRY" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text474/refs/heads/main/Text474.lua"
                                )
                            )()

                        elseif opt == "AUTO ARRESTAR" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text56/refs/heads/main/Text56.lua"
                                )
                            )()

                        elseif opt == "SER FUERTE" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text475/refs/heads/main/Text475.lua"
                                )
                            )()

                        elseif opt == "COCINAR GENTE (BOTON)" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text476/refs/heads/main/Text476.lua"
                                )
                            )()

                        elseif opt == "OBTENER SHIFTLOCK" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Shift-lock/refs/heads/main/Shift_Lock_.lua"
                                )
                            )()

                        elseif opt == "FLING PLAYER" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text156/refs/heads/main/Text156.lua"
                                )
                            )()

                        elseif opt == "QUITAR LAS PAREDES INVISIBLES" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text365/refs/heads/main/Text365.lua"
                                )
                            )()

                        elseif opt == "OBTENER MONEDAS (salirse para desactivar)" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text477/refs/heads/main/Text477.lua"
                                )
                            )()

                        elseif opt == "AIMBOT TOTAL" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text93/refs/heads/main/Text93.lua"
                                )
                            )()

                        elseif opt == "X-RAY" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua"
                                )
                            )()

                        elseif opt == "TP TO PLAYER" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text408/refs/heads/main/Text408.lua"
                                )
                            )()

                        elseif opt == "AIMBOT LIGERO" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text422/refs/heads/main/Text422.lua"
                                )
                            )()

                        elseif opt == "FLY" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Fly/refs/heads/main/Fly.lua"
                                )
                            )()

                        elseif opt == "INFINITI JUMP" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/INFINITI-JUMP/refs/heads/main/Salto%20infinito.lua",
                                    true
                                )
                            )()

                        elseif opt == "SHOOT THE MURDERER" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text314/refs/heads/main/Text314.lua",
                                    true
                                )
                            )()

                        elseif opt == "LOCALPLAYER" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua"
                                )
                            )()

                        elseif opt == "NOCLIP" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/NOCLIP/refs/heads/main/NOCLIP.lua"
                                )
                            )()

                        elseif opt == "ESP PANELS" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text211/refs/heads/main/Text211.lua"
                                )
                            )()

                        elseif opt == "Fps Boost" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Fps-Boost-/refs/heads/main/FPS_BOOST_UNIVERSAL.lua"
                                )
                            )()

                        elseif opt == "INVISIBLE" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text427/refs/heads/main/Text427.lua"
                                )
                            )()

                        elseif opt == "TOUCH FLING" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text281/refs/heads/main/Text281.lua"
                                )
                            )()

                        elseif opt == "YOUTUBE:SBS HUB" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Copiar-canal/refs/heads/main/Suscribete.lua"
                                )
                            )()

                        elseif opt == "TP TOOL" then

                            loadstring(
                                game:HttpGet(
                                    "https://raw.githubusercontent.com/davidsebas348-hub/Text331/refs/heads/main/Text331.lua"
                                )
                            )()

                        end
                    end
                )

                -- ======================
                -- CALCULAR ESPACIO
                -- DE LA DESCRIPCION
                -- ======================

                local custom =
                    BUTTON_CUSTOM[opt]

                local offsetY =
                    custom and custom.y or 0

                local isDoubleLeft =
                    doubleButtons[opt] ~= nil

                -- ESPACIO DEL BOTON
                local extraDescription =
                    getDescriptionHeight(
                        buttonDescriptions[opt],
                        rightFrame
                    )

                if not isDoubleLeft then

                    oy +=
                        40 +
                        offsetY +
                        extraDescription
                end

                -- ======================
                -- DESCRIPCION
                -- ======================

                local descriptionText =
                    buttonDescriptions[opt]

                if descriptionText then

                    local description =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    description.Name =
                        "Description_" .. opt

                    local descriptionHeight =
                        math.max(
                            18,
                            TextService:GetTextSize(
                                descriptionText,
                                12,
                                Enum.Font.Gotham,
                                Vector2.new(
                                    math.max(
                                        100,
                                        rightFrame.AbsoluteSize.X - 40
                                    ),
                                    1000
                                )
                            ).Y
                        )

                    description.Size =
                        UDim2.new(
                            1,-20,
                            0,
                            descriptionHeight
                        )

                    description.Position =
                        UDim2.new(
                            0,10,
                            0,
                            oy - extraDescription + 33
                        )

                    description.BackgroundTransparency = 1

                    description.Text =
                        descriptionText

                    description.TextColor3 =
                        Color3.fromRGB(
                            160,160,160
                        )

                    description.Font =
                        Enum.Font.Gotham

                    description.TextSize = 12

                    description.TextWrapped = true

                    description.TextXAlignment =
                        Enum.TextXAlignment.Left

                    description.TextYAlignment =
                        Enum.TextYAlignment.Top

                    description.ZIndex = 2
                end

                -- ======================
                -- TITULO PERSONALIZADO ABAJO
                -- ======================

                local customTitle =
                    customTitles[opt]

                if customTitle then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,
                            0,30
                        )

                    section.Position =
                        UDim2.new(
                            0,10,
                            0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        customTitle

                    section.TextColor3 =
                        Color3.fromRGB(
                            255,255,255
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 18

                    section.TextXAlignment =
                        Enum.TextXAlignment.Center

                    oy += 35
                end
            end
        end
    )
end

-- ======================
-- ICONO SBS
-- ======================

local toggle =
    Instance.new(
        "TextButton",
        screenGui
    )

toggle.Size =
    UDim2.new(0,60,0,60)

toggle.Position =
    UDim2.new(1,-80,0,20)

toggle.BackgroundColor3 =
    Color3.fromRGB(20,20,20)

toggle.Text = "SBS"

toggle.TextColor3 =
    Color3.fromRGB(255,255,255)

toggle.Font =
    Enum.Font.GothamBold

toggle.TextSize = 24

toggle.BorderSizePixel = 0

local iconCorner =
    Instance.new(
        "UICorner",
        toggle
    )

iconCorner.CornerRadius =
    UDim.new(0.3,0)

-- ======================
-- DRAG DEL ICONO
-- ======================

do

    local dragging
    local dragStart
    local startPos
    local dragInput

    local function update(input)

        local delta =
            input.Position - dragStart

        toggle.Position =
            UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
    end

    toggle.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startPos =
                toggle.Position

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false
                end
            end)
        end
    end)

    toggle.InputChanged:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)

        if input == dragInput
        and dragging then

            update(input)
        end
    end)
end

-- ======================
-- ABRIR / CERRAR
-- ======================

local open = true

toggle.MouseButton1Click:Connect(function()

    open = not open

    mainFrame.Visible = open
end)
