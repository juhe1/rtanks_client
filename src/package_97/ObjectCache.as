package package_97
{
   public class ObjectCache
   {
       
      
      private var size:int;
      
      private var objects:Vector.<Object>;
      
      public function ObjectCache()
      {
         super();
         this.objects = new Vector.<Object>();
      }
      
      public function name_1237(param1:Object) : void
      {
         var _loc2_:* = this.size++;
         this.objects[_loc2_] = param1;
      }
      
      public function name_1621() : Object
      {
         if(this.name_1400())
         {
            throw new Error();
         }
         --this.size;
         var _loc1_:Object = this.objects[this.size];
         this.objects[this.size] = null;
         return _loc1_;
      }
      
      public function name_1400() : Boolean
      {
         return this.size == 0;
      }
   }
}
