//////////////////////// Update Text Hint Button
@addMethod(UI_SystemDef)
    public final func UpdateTextHintButton(scriptInterface: ref<StateGameScriptInterface>, Text: String, opt ActionButtonCname: CName) -> Void {
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
        GameInstance.GetUISystem(scriptInterface.owner.GetGame()).QueueEvent(evt);           
    }
//////////////////////// Clear UI (For button hints)
@addMethod(UI_SystemDef)
    public func ClearUI(stateContext: ref<StateContext>, scriptInterface: ref<StateGameScriptInterface>) -> Void {
        let evt1: ref<DeleteInputHintBySourceEvent>;
        evt1 = new DeleteInputHintBySourceEvent();
        evt1.source = Cast("Debug");
        evt1.targetHintContainer = n"GameplayInputHelper";
        GameInstance.GetUISystem(scriptInterface.owner.GetGame()).QueueEvent(evt1);
    }