local inv = "https://discord.gg/8RppsqJuFm"
setclipboard(tostring(inv))

function notify(x, y, t)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = x,
            Text = y,
            Duration = t
        }
    )
end
notify("set inv to clipboard", "leg's admin v2", 3)
task.wait(2)
notify("joining discord...", "leg's admin v2", 1")
syn.request({Url = "http://127.0.0.1:6463/rpc?v=1", Method = "POST", Headers = { ["Content-Type"] = "application/json", ["Origin"] = "https://discord.com" },
Body = game:GetService("HttpService"):JSONEncode({cmd = "INVITE_BROWSER", args = {code = "8RppsqJuFm" }, nonce = game:GetService("HttpService"):GenerateGUID(false)})})

