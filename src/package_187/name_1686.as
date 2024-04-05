package package_187
{
   import package_355.name_1688;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1686
   {
       
      
      private var var_2427:Vector.<name_1688>;
      
      private var var_199:Vector.<name_70>;
      
      public function name_1686(param1:Vector.<name_1688> = null, param2:Vector.<name_70> = null)
      {
         super();
         this.var_2427 = param1;
         this.var_199 = param2;
      }
      
      public function get modelsData() : Vector.<name_1688>
      {
         return this.var_2427;
      }
      
      public function set modelsData(param1:Vector.<name_1688>) : void
      {
         this.var_2427 = param1;
      }
      
      public function get objects() : Vector.<name_70>
      {
         return this.var_199;
      }
      
      public function set objects(param1:Vector.<name_70>) : void
      {
         this.var_199 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ObjectsData [";
         _loc1_ += "modelsData = " + this.modelsData + " ";
         _loc1_ += "objects = " + this.objects + " ";
         return _loc1_ + "]";
      }
   }
}
