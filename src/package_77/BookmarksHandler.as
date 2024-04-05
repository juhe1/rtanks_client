package package_77
{
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import package_76.CameraBookmarks;
   import package_76.name_2613;
   
   public class BookmarksHandler implements class_47
   {
       
      
      private var var_2343:Object;
      
      private var var_2342:Dictionary;
      
      private var var_2241:SpectatorCameraController;
      
      public function BookmarksHandler(param1:SpectatorCameraController)
      {
         this.var_2343 = new CameraBookmarks(10);
         this.var_2342 = new Dictionary();
         super();
         this.var_2241 = param1;
         this.method_2363();
      }
      
      public function method_190(param1:KeyboardEvent) : void
      {
         var _loc2_:* = this.var_2342[param1.keyCode];
         if(_loc2_ != null)
         {
            if(param1.ctrlKey)
            {
               this.saveCurrentPositionCameraToBookmark(_loc2_);
            }
            else
            {
               this.method_2362(_loc2_);
            }
         }
      }
      
      public function method_1036(param1:KeyboardEvent) : void
      {
      }
      
      private function method_2363() : void
      {
         this.var_2342[Keyboard.NUMBER_0] = 0;
         this.var_2342[Keyboard.NUMBER_1] = 1;
         this.var_2342[Keyboard.NUMBER_2] = 2;
         this.var_2342[Keyboard.NUMBER_3] = 3;
         this.var_2342[Keyboard.NUMBER_4] = 4;
         this.var_2342[Keyboard.NUMBER_5] = 5;
         this.var_2342[Keyboard.NUMBER_6] = 6;
         this.var_2342[Keyboard.NUMBER_7] = 7;
         this.var_2342[Keyboard.NUMBER_8] = 8;
         this.var_2342[Keyboard.NUMBER_9] = 9;
      }
      
      private function saveCurrentPositionCameraToBookmark(param1:int) : void
      {
         this.var_2343.saveCurrentPositionCameraToBookmark(param1);
      }
      
      private function method_2362(param1:int) : void
      {
         var _loc2_:name_2613 = this.var_2343.getBookmark(param1);
         if(_loc2_ != null)
         {
            this.var_2241.method_1065(_loc2_.position,_loc2_.name_2614);
         }
      }
   }
}
