package alternativa.tanks
{
   import alternativa.engine3d.core.Clipping;
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.objects.Mesh;
   
   public class Polygon extends Mesh
   {
       
      
      public function Polygon(param1:Vector.<Number>, param2:Vector.<Number>, param3:Boolean)
      {
         super();
         var _loc4_:int = param1.length / 3;
         var _loc5_:Vector.<int> = new Vector.<int>(_loc4_ + 1);
         _loc5_[0] = _loc4_;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_[_loc6_ + 1] = _loc6_;
            _loc6_++;
         }
         addVerticesAndFaces(param1,param2,_loc5_,true);
         if(param3)
         {
         }
         calculateFacesNormals();
         calculateBounds();
         sorting = Sorting.DYNAMIC_BSP;
         clipping = Clipping.FACE_CLIPPING;
      }
   }
}
