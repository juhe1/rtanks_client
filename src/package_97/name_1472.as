package package_97
{
   import alternativa.engine3d.core.Object3D;
   import package_37.Matrix3;
   import package_37.Vector3;
   
   public class name_1472
   {
      
      private static const const_1917:Number = 0.1;
      
      private static const const_1918:Number = 1;
      
      private static const const_1916:Number = 0.15;
      
      private static const const_1915:Number = 1.3;
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const v:Vector3 = new Vector3();
       
      
      private const const_1913:Matrix3 = new Matrix3();
      
      private const const_1912:Vector3 = new Vector3();
      
      private const const_1914:name_2610 = new name_2610();
      
      private const const_1910:name_2610 = new name_2610();
      
      private const const_1911:name_2610 = new name_2610();
      
      private var var_2327:ParaBonus;
      
      private var var_2328:Number;
      
      private var time:Number;
      
      private var var_745:Number;
      
      private var var_2329:Number;
      
      private var x:Number = 0;
      
      private var y:Number = 0;
      
      public function name_1472(param1:ParaBonus)
      {
         super();
         this.var_2327 = param1;
      }
      
      public function init(param1:Vector3, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.x = param1.x;
         this.y = param1.y;
         this.const_1910.name_2611 = param1.z + name_1460.name_1491 - param2 * param5;
         this.const_1910.angleZ = param6 + name_1460.name_1490 * param5;
         this.var_745 = param2;
         this.var_2328 = param3;
         this.var_2329 = param4;
         this.time = param5;
      }
      
      public function start() : void
      {
      }
      
      public function method_426(param1:Number) : void
      {
         param1 *= 0.001;
         this.const_1914.copy(this.const_1910);
         this.time += param1;
         this.const_1910.name_2611 -= this.var_745 * param1;
         this.const_1910.angleX = 0.1 * Math.sin(1 * (this.var_2329 + this.time));
         this.const_1910.angleZ += (name_1460.name_1490 + 0.2) * param1;
         if(this.const_1910.name_2611 <= this.var_2328)
         {
            this.const_1910.name_2611 = this.var_2328;
            this.const_1910.angleX = 0;
            this.method_465(1);
            this.render();
            this.var_2327.method_1024();
         }
         this.method_2350();
      }
      
      private function method_2350() : void
      {
         m.name_932(this.const_1910.angleX,0,this.const_1910.angleZ);
         m.name_890(Vector3.DOWN,v);
         v.scale(name_1460.name_1491);
         this.var_2327.var_743.update(this.x + v.x,this.y + v.y,this.const_1910.name_2611 + v.z,this.const_1910.angleX,0,this.const_1910.angleZ);
      }
      
      public function method_465(param1:Number) : void
      {
         this.const_1911.interpolate(this.const_1914,this.const_1910,param1);
         this.const_1913.name_932(this.const_1911.angleX,0,this.const_1911.angleZ);
         this.const_1913.name_890(Vector3.DOWN,this.const_1912);
      }
      
      public function render() : void
      {
         this.method_2043(this.var_2327.parachute,name_1460.const_1909,this.const_1912);
         this.method_2043(this.var_2327.skin,name_1460.name_1491,this.const_1912);
         this.var_2327.var_735.name_1482();
      }
      
      private function method_2043(param1:Object3D, param2:Number, param3:Vector3) : void
      {
         param1.rotationX = this.const_1911.angleX;
         param1.rotationZ = this.const_1911.angleZ;
         param1.x = this.x + 50 * param3.x;
         param1.y = this.y + 50 * param3.y;
         param1.z = this.const_1911.name_2611 + param2 * param3.z;
      }
   }
}
