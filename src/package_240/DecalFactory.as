package package_240
{
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.physics.collision.name_1083;
   import flash.geom.Vector3D;
   import package_37.Vector3;
   import package_42.name_73;
   import package_61.name_124;
   
   public class DecalFactory
   {
      
      private static const const_1559:Number = 1.4835298641951802;
      
      private static const var_397:name_124 = new name_124();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const right:Vector3 = new Vector3();
      
      private static const up:Vector3 = new Vector3();
      
      private static const normal:Vector3 = new Vector3();
      
      private static const const_1557:Vector.<Vector3> = Vector.<Vector3>([new Vector3(),new Vector3(),new Vector3(),new Vector3(),new Vector3()]);
      
      private static const const_1558:Vector3D = new Vector3D();
      
      private static const normal3D:Vector3D = new Vector3D();
       
      
      private var name_247:name_1083;
      
      public function DecalFactory(param1:name_1083)
      {
         super();
         this.name_247 = param1;
      }
      
      public function createDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:KDContainer, param6:name_656) : Decal
      {
         var _loc7_:Vector3 = null;
         var _loc8_:Number = NaN;
         direction.diff(param1,param2);
         var _loc9_:Number = direction.vLength() + 200;
         direction.vNormalize();
         right.vCross2(direction,Vector3.Z_AXIS).vNormalize();
         up.vCross2(right,direction);
         Vector3(const_1557[4]).vCopy(param2);
         Vector3(const_1557[0]).vCopy(param2).vAddScaled(50,right);
         Vector3(const_1557[1]).vCopy(param2).vAddScaled(50,up);
         Vector3(const_1557[2]).vCopy(param2).vAddScaled(-50,right);
         Vector3(const_1557[3]).vCopy(param2).vAddScaled(-50,up);
         normal.reset(0,0,0);
         for each(_loc7_ in const_1557)
         {
            if(this.name_247.name_251(_loc7_,direction,name_73.name_252,_loc9_,null,var_397))
            {
               normal.vAdd(var_397.normal);
            }
         }
         normal.vNormalize();
         this.copyToVector3D(param1,const_1558);
         this.copyToVector3D(normal,normal3D);
         _loc8_ = this.method_1622(param6);
         return param5.createDecal(const_1558,normal3D,param3,_loc8_,1.4835298641951802,300,param4);
      }
      
      public function copyToVector3D(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      private function method_1622(param1:name_656) : Number
      {
         switch(param1)
         {
            case name_656.const_1553:
               return 0;
            default:
               return Math.random() * 2 * Math.PI;
         }
      }
   }
}
