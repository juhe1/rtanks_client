package package_313
{
   import alternativa.tanks.models.battlefield.gui.chat.BattleChatOutput;
   import forms.LobbyChat;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class UnblockCommandHandler implements name_1350
   {
       
      
      private var var_633:BattleChatOutput;
      
      public function UnblockCommandHandler(param1:BattleChatOutput)
      {
         super();
         this.var_633 = param1;
      }
      
      public function method_885(param1:Array) : Boolean
      {
         if(param1.length == 0)
         {
            return false;
         }
         var _loc2_:String = String(param1[0]);
         LobbyChat.name_2153(_loc2_);
         var _loc3_:name_102 = name_102(Main.osgi.getService(name_102));
         this.var_633.addSystemMessage(_loc3_.getText(TextConst.CHAT_PANEL_COMMAND_UNBLOCK,_loc2_));
         return true;
      }
   }
}
