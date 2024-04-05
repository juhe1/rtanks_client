package package_136
{
   import platform.client.fp10.core.type.name_70;
   
   public class name_395
   {
       
      
      private var _item:name_70;
      
      public function name_395(param1:name_70 = null)
      {
         super();
         this._item = param1;
      }
      
      public function get item() : name_70
      {
         return this._item;
      }
      
      public function set item(param1:name_70) : void
      {
         this._item = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "MountedSkinCC [";
         _loc1_ += "item = " + this.item + " ";
         return _loc1_ + "]";
      }
   }
}
