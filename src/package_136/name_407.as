package package_136
{
   import platform.client.fp10.core.type.name_70;
   
   public class name_407
   {
       
      
      private var _skins:Vector.<name_70>;
      
      public function name_407(param1:Vector.<name_70> = null)
      {
         super();
         this._skins = param1;
      }
      
      public function get skins() : Vector.<name_70>
      {
         return this._skins;
      }
      
      public function set skins(param1:Vector.<name_70>) : void
      {
         this._skins = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "AvailableSkinsCC [";
         _loc1_ += "skins = " + this.skins + " ";
         return _loc1_ + "]";
      }
   }
}
