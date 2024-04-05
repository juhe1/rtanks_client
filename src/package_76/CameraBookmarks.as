package package_76
{
   public class CameraBookmarks
   {
       
      
      private var var_2343:Vector.<name_2613>;
      
      public function CameraBookmarks(param1:int)
      {
         super();
         this.var_2343 = new Vector.<name_2613>(param1);
      }
      
      public function getBookmark(param1:uint) : name_2613
      {
         if(param1 < this.var_2343.length)
         {
            return this.var_2343[param1];
         }
         return null;
      }
      
      public function saveCurrentPositionCameraToBookmark(param1:uint) : void
      {
         if(param1 < this.var_2343.length)
         {
            this.method_2925(param1).name_3183();
         }
      }
      
      private function method_2925(param1:uint) : name_2613
      {
         if(this.var_2343[param1] == null)
         {
            this.var_2343[param1] = new name_2613();
         }
         return this.var_2343[param1];
      }
   }
}
