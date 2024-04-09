package alternativa.physics.collision
{
   import alternativa.physics.Body;
   import alternativa.physics.name_888;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_61.name_767;
   
   public class CollisionPrimitive
   {
      
      public static const name_1166:int = 1;
      
      public static const name_1179:int = 2;
      
      public static const name_1180:int = 4;
      
      public static const name_1181:int = 8;
       
      
      public var type:int;
      
      public var collisionGroup:int;
      
      public var var_1430:class_44;
      
      public var name_787:Body;
      
      public var name_892:Matrix4;
      
      public var transform:Matrix4;
      
      public var var_308:name_767;
      
      public var material:name_888;
      
      public function CollisionPrimitive(param1:int, param2:int, param3:name_888)
      {
         this.transform = new Matrix4();
         this.var_308 = new name_767();
         super();
         this.type = param1;
         this.collisionGroup = param2;
         this.material = param3;
      }
      
      public function name_891(param1:Body, param2:Matrix4 = null) : void
      {
         if(this.name_787 == param1)
         {
            return;
         }
         this.name_787 = param1;
         if(param1 != null)
         {
            if(param2 != null)
            {
               if(this.name_892 == null)
               {
                  this.name_892 = new Matrix4();
               }
               this.name_892.copy(param2);
            }
            else
            {
               this.name_892 = null;
            }
         }
      }
      
      public function calculateAABB() : name_767
      {
         return this.var_308;
      }
      
      public function raycast(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : Number
      {
         return -1;
      }
      
      public function clone() : CollisionPrimitive
      {
         var _loc1_:CollisionPrimitive = this.method_1641();
         return _loc1_.method_413(this);
      }
      
      public function method_413(param1:CollisionPrimitive) : CollisionPrimitive
      {
         if(param1 == null)
         {
            throw new ArgumentError("Parameter source cannot be null");
         }
         this.type = param1.type;
         this.transform.copy(param1.transform);
         this.collisionGroup = param1.collisionGroup;
         this.name_891(param1.name_787,param1.name_892);
         this.var_308.method_413(param1.var_308);
         return this;
      }
      
      public function toString() : String
      {
         return "[CollisionPrimitive type=" + this.type + "]";
      }
      
      protected function method_1641() : CollisionPrimitive
      {
         return new CollisionPrimitive(this.type,this.collisionGroup,this.material);
      }
      
      public function destroy() : *
      {
         this.name_892 = null;
         this.transform = null;
      }
   }
}
