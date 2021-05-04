   
   

//////////////////////// Show Text 
@addMethod(UI_SystemDef)
        public func ShowText(scriptInterface: ref<StateGameScriptInterface>, messagestring: String, isnotwarning: Bool) -> Void {
            let onScreenMessage: SimpleScreenMessage;
            let blackboardDef = GetAllBlackboardDefs().UI_Notifications;
            let blackboard = GameInstance.GetBlackboardSystem(scriptInterface.owner.GetGame()).Get(blackboardDef);
            onScreenMessage.isShown = true;
            onScreenMessage.message = messagestring;
            onScreenMessage.duration = 5.00;
            onScreenMessage.isInstant = true;

            if Equals(isnotwarning,true){
                blackboard.SetVariant(blackboardDef.OnscreenMessage, ToVariant(onScreenMessage), true);

            }else{
                blackboard.SetVariant(blackboardDef.WarningMessage, ToVariant(onScreenMessage), true);
            }
        }

//////////////////////// Show Text By Game Instance
 @addMethod(UI_SystemDef)
        public func ShowText(gi: GameInstance,messagestring: String, isnotwarning: Bool) -> Void {
            let onScreenMessage: SimpleScreenMessage;
            let blackboardDef = GetAllBlackboardDefs().UI_Notifications;
            let blackboard = GameInstance.GetBlackboardSystem(gi).Get(blackboardDef);
            onScreenMessage.isShown = true;
            onScreenMessage.message = messagestring;
            onScreenMessage.duration = 5.00;
            onScreenMessage.isInstant = true;

            if Equals(isnotwarning,true){
                blackboard.SetVariant(blackboardDef.OnscreenMessage, ToVariant(onScreenMessage), true);

            }else{
                blackboard.SetVariant(blackboardDef.WarningMessage, ToVariant(onScreenMessage), true);
            }
        }
class HudTextEvent
{
    let messagestring: String;
    let isnotwarning: Bool;
    let scriptinterface: ref<StateGameScriptInterface>;
    let gameinstance: GameInstance;

    public func PlayEventOnScriptInterface() -> Void{
        GetAllBlackboardDefs().UI_System.ShowText(this.scriptinterface, this.messagestring, this.isnotwarning);
    }

    public func PlayEventOnGameInstance() -> Void{
        GetAllBlackboardDefs().UI_System.ShowText(this.gameinstance, this.messagestring, this.isnotwarning);
    }
}

////////////////////////
   