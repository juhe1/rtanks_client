package package_97
{
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class name_1470
   {
      
      private static const const_64:Vector3 = new Vector3();
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const const_1919:Number = 2.5;
       
      
      private var bonus:ParaBonus;
      
      private var normal:Vector3;
      
      private var pivot:Vector3;
      
      private var const_1653:Vector3;
      
      private var angle:Number;
      
      private var axis:Vector3;
      
      private var const_1914:name_2612;
      
      private var const_1910:name_2612;
      
      private var const_1911:name_2612;
      
      public function name_1470(param1:ParaBonus)
      {
         super();
         this.normal = new Vector3();
         this.pivot = new Vector3();
         this.const_1653 = new Vector3();
         this.axis = new Vector3();
         this.const_1914 = new name_2612();
         this.const_1910 = new name_2612();
         this.const_1911 = new name_2612();
         this.bonus = param1;
      }
      
      public function init(param1:Vector3, param2:Vector3) : void
      {
         this.pivot.vCopy(param1);
         this.normal.vCopy(param2);
      }
      
      public function start() : void
      {
         var _loc1_:BonusMesh = this.bonus.skin;
         this.const_1653.reset(_loc1_.x,_loc1_.y,_loc1_.z);
         this.const_1653.subtract(this.pivot);
         this.axis.vCopy(Vector3.Z_AXIS);
         this.axis.cross(this.normal);
         this.axis.vNormalize();
         this.angle = Math.acos(this.normal.z);
         this.const_1910.position.reset(_loc1_.x,_loc1_.y,_loc1_.z);
         this.const_1910.orientation.name_222(_loc1_.rotationX,_loc1_.rotationY,_loc1_.rotationZ);
         this.const_1914.copy(this.const_1910);
      }
      
      public function method_426(param1:Number) : void
      {
         param1 *= 0.001;
         this.const_1914.copy(this.const_1910);
         var _loc2_:Number = 2.5 * param1;
         if(_loc2_ > this.angle)
         {
            _loc2_ = this.angle;
            this.angle = 0;
         }
         else
         {
            this.angle -= _loc2_;
         }
         m.name_1097(this.axis,_loc2_);
         this.const_1653.vTransformBy3(m);
         this.const_1910.position.vCopy(this.pivot).vAdd(this.const_1653);
         this.const_1910.orientation.name_895(this.axis,_loc2_);
         this.method_2350();
         if(this.angle == 0)
         {
            this.method_465(1);
            this.render();
            this.bonus.method_1022();
         }
      }
      
      private function method_2350() : void
      {
         this.const_1910.orientation.toMatrix3(m);
         this.bonus.var_743.method_2340(this.const_1910.position,m);
      }
      
      public function method_465(param1:Number) : void
      {
         this.const_1911.interpolate(this.const_1914,this.const_1910,param1);
      }
      
      public function render() : void
      {
         var _loc1_:BonusMesh = this.bonus.skin;
         _loc1_.x = this.const_1911.position.x;
         _loc1_.y = this.const_1911.position.y;
         _loc1_.z = this.const_1911.position.z;
         this.const_1911.orientation.name_182(const_64);
         _loc1_.rotationX = const_64.x;
         _loc1_.rotationY = const_64.y;
         _loc1_.rotationZ = const_64.z;
      }
   }
}
