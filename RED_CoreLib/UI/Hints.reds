module RED_CoreLib.UI
///////////////////////////////////////////////////////////////////////////////////////
public static class Hints {
    public static func UpdateHintButton(gi: GameInstance, Text: String, opt ActionButtonCname: CName) -> Void {
    let evt: ref<UpdateInputHintEvent>;
    let evt: ref<UpdateInputHintEvent>;
    let data: InputHintData; 
        data.action = ActionButtonCname;
        data.source = n"Debug";
        data.localizedLabel = Text;
        evt = new UpdateInputHintEvent();
        evt.data = data;
        evt.show = true;
        evt.targetHintContainer = n"GameplayInputHelper";
        GameInstance.GetUISystem(gi).QueueEvent(evt);           
    }
    
    public static func ClearUI(gi: GameInstance) -> Void {
    let evt1: ref<DeleteInputHintBySourceEvent>;
        evt1 = new DeleteInputHintBySourceEvent();
        evt1.source = Cast("Debug");
        evt1.targetHintContainer = n"GameplayInputHelper";
        GameInstance.GetUISystem(gi).QueueEvent(evt1);
    }

    public static func ShowText(gi: GameInstance,messagestring: String, isnotwarning: Bool) -> Void {
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
        };
    }
}
///////////////////////////////////////////////////////////////////////////////////////
public class HudTextEvent
{
    let messagestring: String;
    let isnotwarning: Bool;
    let scriptinterface: ref<StateGameScriptInterface>;
    let gameinstance: GameInstance;
    public func PlayEventOnGameInstance() -> Void{
        Hints.ShowText(this.gameinstance, this.messagestring, this.isnotwarning);
    }
}
///////////////////////////////////////////////////////////////////////////////////////
