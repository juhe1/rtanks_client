package package_390
{
   import controls.chat.ChatPermissionsLevel;
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   
   public class ChatUserLabel extends name_1889
   {
      
      public static const const_2745:int = 16;
      
      private static const const_2744:Dictionary = new Dictionary();
      
      {
         const_2744[1] = ChatPermissionsLevel.name_3488(1);
         const_2744[2] = ChatPermissionsLevel.name_3488(2);
         const_2744[3] = ChatPermissionsLevel.name_3488(3);
         const_2744[4] = ChatPermissionsLevel.name_3488(4);
         const_2744[5] = ChatPermissionsLevel.name_3488(5);
         const_2744[6] = ChatPermissionsLevel.name_3488(6);
         const_2744[7] = ChatPermissionsLevel.name_3488(7);
         const_2744[8] = ChatPermissionsLevel.name_3488(8);
         const_2744[9] = ChatPermissionsLevel.name_3488(9);
         const_2744[10] = ChatPermissionsLevel.name_3488(10);
      }
      
      protected var var_845:int = 0;
      
      protected var var_3557:Boolean;
      
      public function ChatUserLabel(param1:String, param2:Boolean = true)
      {
         this.var_3557 = this.var_845 != 0;
         super(param1);
      }
      
      override protected function method_2563() : void
      {
         var _loc1_:Bitmap = null;
         _loc1_ = null;
         if(this.var_3557)
         {
            _loc1_ = new Bitmap(const_2744[this.var_845]);
            _loc1_.x = 20 + 1;
            _loc1_.y = 3;
            var_2577.addChild(_loc1_);
         }
      }
      
      override protected function method_2568() : Number
      {
         return this.var_3557 ? Number(Number(16)) : Number(Number(0));
      }
   }
}
