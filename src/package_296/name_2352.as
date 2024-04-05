package package_296
{
   import alternativa.tanks.models.battlefield.gui.chat.BattleChatUserLabel;
   import controls.Label;
   import package_291.name_1099;
   import package_294.name_2538;
   import package_390.ChatUpdateEvent;
   import package_427.class_179;
   import package_427.name_2537;
   
   public class name_2352 extends name_2537
   {
       
      
      private var var_3048:BattleChatUserLabel;
      
      private var label:Label;
      
      public function name_2352(param1:name_1099, param2:String, param3:name_1099 = null)
      {
         super();
         if(param1 != null)
         {
            this.method_1595(param1);
         }
         this.method_582(param2);
         if(param3 != null)
         {
            this.method_1595(param3);
         }
      }
      
      private function method_1595(param1:name_1099) : void
      {
         this.var_3048 = new BattleChatUserLabel(param1.userId,param1.rank);
         this.var_3048.addEventListener(ChatUpdateEvent.UPDATE,this.method_2834);
         this.var_3048.name_2046(class_179.method_2283(param1.teamType),true);
         this.var_3048.x = width + 4;
         addChild(this.var_3048);
      }
      
      private function method_2834(param1:ChatUpdateEvent) : void
      {
         this.var_3048.x = 4;
         if(this.label != null)
         {
            this.label.x = this.var_3048.width + 4;
         }
         dispatchEvent(new name_2538(name_2538.name_3053,this));
      }
      
      private function method_582(param1:String) : void
      {
         var _loc2_:Label = null;
         _loc2_ = new Label();
         _loc2_.text = param1;
         _loc2_.x = width + 4;
         var_2577.addChild(_loc2_);
      }
   }
}
