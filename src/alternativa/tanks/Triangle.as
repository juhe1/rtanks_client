package alternativa.tanks
{
   import flash.geom.Vector3D;
   
   public class Triangle extends Polygon
   {
       
      
      public function Triangle(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Boolean)
      {
         var _loc5_:Vector.<Number> = Vector.<Number>([param1.x,param1.y,param1.z,param2.x,param2.y,param2.z,param3.x,param3.y,param3.z]);
         var _loc6_:Vector.<Number> = Vector.<Number>([0,0,0,1,1,1]);
         super(_loc5_,_loc6_,param4);
      }
   }
}
