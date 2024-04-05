package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Object3D;
   import package_37.Matrix4;
   import package_37.Vector3;
   
   public class name_907
   {
       
      
      private var var_1723:Vector3;
      
      private var transform:Matrix4;
      
      public function name_907(param1:Object3D)
      {
         super();
         this.var_1723 = new Vector3(param1.boundMaxX - param1.boundMinX,param1.boundMaxY - param1.boundMinY,param1.boundMaxZ - param1.boundMinZ);
         this.var_1723 = this.var_1723.scale(0.5);
         this.transform = new Matrix4();
         var _loc2_:Vector3 = new Vector3(param1.boundMaxX + param1.boundMinX,param1.boundMinY + param1.boundMaxY,param1.boundMinZ + param1.boundMaxZ);
         _loc2_.scale(0.5);
         this.transform.name_943(_loc2_.x + param1.x,_loc2_.y + param1.y,_loc2_.z + param1.z,param1.rotationX,param1.rotationY,param1.rotationZ);
      }
      
      public function name_933() : Vector3
      {
         return this.var_1723;
      }
      
      public function name_953() : Matrix4
      {
         return this.transform;
      }
   }
}
