package controls.chat
{
   import package_423.ChatAddressMode;
   import package_423.MessageType;
   
   public class name_3079
   {
       
      
      private var var_3565:name_2508;
      
      private var var_3563:name_2508;
      
      private var var_3120:ChatAddressMode;
      
      private var text:String;
      
      private var var_3564:MessageType;
      
      private var html:Boolean;
      
      public function name_3079(param1:name_2508, param2:name_2508, param3:ChatAddressMode, param4:String, param5:MessageType, param6:Boolean)
      {
         super();
         this.var_3565 = param1;
         this.var_3563 = param2;
         this.var_3120 = param3;
         this.text = param4;
         this.var_3564 = param5;
         this.html = param6;
      }
      
      public function name_3082() : name_2508
      {
         return this.var_3565;
      }
      
      public function name_3083() : name_2508
      {
         return this.var_3563;
      }
      
      public function name_3084() : ChatAddressMode
      {
         return this.var_3120;
      }
      
      public function getText() : String
      {
         return this.text;
      }
      
      public function name_3081() : MessageType
      {
         return this.var_3564;
      }
      
      public function name_3080() : Boolean
      {
         return this.html;
      }
   }
}
