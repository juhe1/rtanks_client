package package_422
{
   import alternativa.tanks.models.tank.TankData;
   import package_37.Vector3;
   
   public class ShaftShotResult
   {
       
      
      public var targets:Array;
      
      public var hitPoints:Array;
      
      public var dir:Vector3;
      
      public function ShaftShotResult()
      {
         this.targets = [];
         this.hitPoints = [];
         this.dir = new Vector3();
         super();
      }
      
      public function name_2487() : String
      {
         var obj:Object = new Object();
         obj.targets = this.targets;
         obj.hitPoints = this.hitPoints;
         obj.dir = this.dir;
         return JSON.stringify(obj,function(param1:*, param2:*):*
         {
            var _loc3_:* = undefined;
            var _loc4_:* = undefined;
            if(param2 is Vector3)
            {
               _loc3_ = param2 as Vector3;
               return {
                  "x":_loc3_.x,
                  "y":_loc3_.y,
                  "z":_loc3_.z
               };
            }
            if(param2 is TankData)
            {
               _loc4_ = param2 as TankData;
               return {"target_id":_loc4_.userName};
            }
            return param2;
         });
      }
   }
}
