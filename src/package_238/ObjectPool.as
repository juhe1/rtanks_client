package package_238
{
   import flash.utils.Dictionary;
   
   public class ObjectPool
   {
       
      
      private var var_739:Dictionary;
      
      public function ObjectPool()
      {
         this.var_739 = new Dictionary();
         super();
      }
      
      public function getObject(param1:Class) : Object
      {
         var _loc2_:Pool = this.var_739[param1];
         if(_loc2_ == null)
         {
            this.var_739[param1] = _loc2_ = new Pool();
         }
         var _loc3_:Object = _loc2_.getObject();
         return _loc3_ == null ? new param1(this) : _loc3_;
      }
      
      internal function putObject(param1:Class, param2:Object) : void
      {
         var _loc3_:Pool = this.var_739[param1];
         if(_loc3_ == null)
         {
            this.var_739[param1] = _loc3_ = new Pool();
         }
         _loc3_.putObject(param2);
      }
      
      public function clear() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.var_739)
         {
            Pool(this.var_739[_loc1_]).clear();
            delete this.var_739[_loc1_];
         }
      }
   }
}

class Pool
{
    
   
   private var objects:Vector.<Object>;
   
   private var numObjects:int;
   
   public function Pool()
   {
      this.objects = new Vector.<Object>();
      super();
   }
   
   public function getObject() : Object
   {
      if(this.numObjects == 0)
      {
         return null;
      }
      var _loc1_:Object = this.objects[--this.numObjects];
      this.objects[this.numObjects] = null;
      return _loc1_;
   }
   
   public function putObject(param1:Object) : void
   {
      var _loc2_:* = this.numObjects++;
      this.objects[_loc2_] = param1;
   }
   
   public function clear() : void
   {
      this.objects.length = 0;
      this.numObjects = 0;
   }
}
