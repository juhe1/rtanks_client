package package_309
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import package_1.Main;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_76.name_654;
   import package_76.name_735;
   
   public class name_1255 implements name_654
   {
      
      private static const const_1829:Matrix3 = new Matrix3();
      
      private static const var_558:Matrix3 = new Matrix3();
      
      private static const var_514:Vector3 = new Vector3();
       
      
      private var var_142:Vector3;
      
      private var var_2116:Object3D;
      
      private var var_2115:Number = 0;
      
      private var var_2122:Vector3;
      
      private var var_2117:Number;
      
      private var var_2119:Number;
      
      private var var_2121:int;
      
      private var var_2125:Number = 1;
      
      private var var_2123:Number = 1;
      
      private var var_2118:Number = 0;
      
      private var var_2124:Number = 5;
      
      private var var_11:BattlefieldModel;
      
      public var var_1886:Number = 400000;
      
      public var name_1414:Number = 5;
      
      public var var_690:Number = 3.141592653589793;
      
      public var radius:Number = 0;
      
      public var direction:Vector3;
      
      private var e1:Vector3;
      
      private var e2:Vector3;
      
      private var method_613:int = 1;
      
      private var var_2126:Number = 0;
      
      private var var_2127:Number = 0;
      
      private var var_2128:Boolean = true;
      
      private var var_2120:Number;
      
      public function name_1255(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         this.direction = new Vector3();
         this.e1 = new Vector3();
         this.e2 = new Vector3();
         this.var_2122 = new Vector3();
         super();
         this.var_2117 = param1;
         this.var_2119 = param2;
         this.var_2125 = param3;
         this.var_2124 = param4;
         this.reload();
         this.var_11 = Main.osgi.name_6(name_83) as BattlefieldModel;
         this.direction.reset(1 - 2 * Math.random(),1 - 2 * Math.random(),1 - 2 * Math.random()).vNormalize();
         this.var_142 = new Vector3();
         this.var_2120 = Math.random() * 2 * Math.PI;
      }
      
      public function reload() : void
      {
         this.var_2126 = 0;
         this.var_2127 = 0;
         this.method_613 = 1;
      }
      
      public function set name_1269(param1:int) : void
      {
         if(this.var_2121 != param1)
         {
            this.var_2121 = param1;
            this.var_2118 = 0;
         }
      }
      
      public function name_1263() : Boolean
      {
         return this.var_2115 == this.var_2117 || this.var_2115 == this.var_2119;
      }
      
      public function name_2479(param1:Vector3) : void
      {
         var _loc2_:name_735 = null;
         _loc2_ = this.var_11.var_117.viewport.camera;
         param1.x = _loc2_.x;
         param1.y = _loc2_.y;
         param1.z = _loc2_.z;
      }
      
      public function name_2477(param1:Vector3) : void
      {
         var _loc2_:name_735 = this.var_11.var_117.viewport.camera;
         var _loc3_:Vector3 = _loc2_.var_1441;
         param1.vCopy(_loc3_);
      }
      
      public function get elevation() : Number
      {
         return this.var_2115;
      }
      
      public function set elevation(param1:Number) : void
      {
         if(param1 > this.var_2117)
         {
            this.var_2115 = this.var_2117;
         }
         else if(param1 < this.var_2119)
         {
            this.var_2115 = this.var_2119;
         }
         else
         {
            this.var_2115 = param1;
         }
      }
      
      public function name_2486(param1:Object3D) : void
      {
         this.var_2116 = param1;
      }
      
      public function name_2489(param1:Vector3) : void
      {
         this.var_2122.vCopy(param1);
      }
      
      public function name_1284(param1:Number) : void
      {
         this.var_2123 = param1;
      }
      
      public function activate(param1:name_735) : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function update(param1:name_735, param2:int, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = param3 / 1000;
         if(this.var_2121 != 0)
         {
            this.var_2118 += this.var_2124 * _loc5_;
            _loc4_ = this.var_2125 * this.var_2123;
            if(this.var_2118 > _loc4_)
            {
               this.var_2118 = _loc4_;
            }
            this.var_2115 += this.var_2121 * this.var_2118 * _loc5_;
            if(this.var_2115 > this.var_2117)
            {
               this.var_2115 = this.var_2117;
            }
            else if(this.var_2115 < this.var_2119)
            {
               this.var_2115 = this.var_2119;
            }
         }
         var _loc6_:Number = this.var_11.var_156.value;
         var _loc7_:Number = this.var_11.var_153.value;
         var _loc8_:Number = this.var_11.var_158.value;
         const_1829.name_932(this.var_2116.rotationX,this.var_2116.rotationY,this.var_2116.rotationZ);
         var_558.name_1097(Vector3.X_AXIS,this.var_2115 - Math.PI / 2);
         var_558.append(const_1829);
         var_558.name_182(var_514);
         var _loc9_:name_735 = this.var_11.var_117.viewport.camera;
         _loc9_.rotationX = var_514.x;
         _loc9_.rotationY = var_514.y;
         _loc9_.rotationZ = var_514.z;
         const_1829.name_890(this.var_2122,var_514);
         _loc9_.x = var_514.x + this.var_2116.x;
         _loc9_.y = var_514.y + this.var_2116.y;
         _loc9_.z = var_514.z + this.var_2116.z;
      }
      
      public function name_1264(param1:Number) : void
      {
         this.var_11.var_117.viewport.camera.fov = param1;
      }
      
      private function method_2222() : Number
      {
         var _loc1_:Number = Math.random();
         var _loc2_:Number = Math.random();
         return _loc1_ > 0.5 ? Number(-_loc2_) : Number(_loc2_);
      }
      
      private function method_2220(param1:Number) : Number
      {
         var _loc2_:Number = Math.random();
         var _loc3_:Number = Math.random();
         this.method_613 = _loc3_ > Math.pow(0.5,param1) ? int(-this.method_613) : int(this.method_613);
         return this.method_613 * _loc2_;
      }
      
      private function method_2221(param1:Number) : Number
      {
         this.method_613 = Math.random() > Math.pow(0.5,param1) ? int(-this.method_613) : int(this.method_613);
         return this.method_613;
      }
      
      private function method_2223(param1:Number, param2:Number, param3:Number, param4:Number) : Vector3
      {
         var _loc5_:Vector3 = new Vector3(Math.atan2(param1 * Math.cos(this.var_2120) * Math.random(),param4),0,Math.atan2(param1 * Math.sin(this.var_2120) * Math.random(),param4));
         this.var_2120 += this.method_2220(param3) * param2;
         return _loc5_;
      }
   }
}
