using Godot;
using System;

public partial class AdminConsole : Panel
{
    LineEdit password;
    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
        password = GetNode<LineEdit>("Password");
    }

    // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(double delta)
    {
    }

    private void OnContinueBtnPressed()
    {
        CheckModerator();
        if (!Multiplayer.IsServer() && !GetTree().Root.GetNode<PlayerScript>("Main/Game/" + Multiplayer.GetUniqueId()).IsModerator)
        {
            GetTree().Root.GetNode<AdminCommands>("Main/Game/AdminCommands").RpcId(1, "AskForModeratorPrivilegies", Multiplayer.GetUniqueId(), password.Text);
            CheckModerator();
        }
        Hide();
    }

    /*[Rpc(MultiplayerApi.RpcMode.AnyPeer)]
    void CheckPassword(int id, string password)
    {
        if (Multiplayer.IsServer())
        {
            ReturnAnswer();
        }
        else
        {
            if (password == GetTree().Root.GetNode<NetworkManager>("Main").moderatorPassword)
            {
                RpcId(id, "ReturnAnswer");
            }
        }        
    }*/

    void CheckModerator()
    {
        if (GetTree().Root.GetNode<PlayerScript>("Main/Game/" + Multiplayer.GetUniqueId()).IsModerator)
        {
            GD.Print("IsModerator");
            GetTree().Root.GetNode<InGameConsole>("Main/CanvasLayer/InGameConsole").Visible = true;
            if (GetParentOrNull<PlayerUI>() != null)
            {
                GetParent<PlayerUI>().SpecialScreen = GetTree().Root.GetNode<InGameConsole>("Main/CanvasLayer/InGameConsole").Visible;
            }
        }
    }
}