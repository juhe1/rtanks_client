package package_405
{
   import alternativa.engine3d.core.Object3DContainer;
   import alternativa.engine3d.objects.Mesh;
   
   public class MeshContainer extends Object3DContainer
   {
       
      
      private var var_1718:Vector.<Mesh>;
      
      public function MeshContainer()
      {
         this.var_1718 = new Vector.<Mesh>();
         super();
      }
      
      public function method_2108() : Vector.<Mesh>
      {
         return this.var_1718;
      }
      
      public function name_2870(param1:Vector.<Mesh>) : void
      {
         var _loc2_:Object3DContainer = null;
         this.var_1718.push(param1[0]);
         addChild(param1[0]);
         param1[0].x = 0;
         param1[0].y = 0;
         param1[0].z = 0;
         if(param1.length == 1)
         {
            return;
         }
         _loc2_ = new Object3DContainer();
         addChild(_loc2_);
         _loc2_.x = param1[1].x;
         _loc2_.y = param1[1].y;
         _loc2_.z = param1[1].z;
         param1[1].x = 0;
         param1[1].y = 0;
         param1[1].z = 0;
         var _loc3_:int = 1;
         while(_loc3_ < param1.length)
         {
            _loc2_.addChild(param1[_loc3_]);
            this.var_1718.push(param1[_loc3_]);
            _loc3_++;
         }
      }
   }
}
