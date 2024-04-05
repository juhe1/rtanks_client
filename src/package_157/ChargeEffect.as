package package_157
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.engine3d.name_1773;
   import alternativa.tanks.sfx.name_657;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   use namespace alternativa3d;
   
   public class ChargeEffect extends class_30 implements name_657
   {
      
      private static var const_2020:Vector3 = new Vector3();
      
      private static var matrix:Matrix4 = new Matrix4();
       
      
      protected var sprite:Sprite3D;
      
      private var _owner:ClientObject;
      
      private var var_2533:Number;
      
      private var name_2698:Number;
      
      private var name_1811:Vector.<name_1773>;
      
      private var numFrames:int;
      
      private var var_2453:Vector3;
      
      private var turret:Object3D;
      
      private var var_170:name_175;
      
      public function ChargeEffect(param1:ObjectPool)
      {
         this.var_2453 = new Vector3();
         super(param1);
         this.sprite = new Sprite3D(1,1);
         this.sprite.useShadowMap = false;
         this.sprite.useLight = false;
      }
      
      public function init(param1:ClientObject, param2:Number, param3:Number, param4:name_1072, param5:Vector3, param6:Object3D, param7:Number, param8:Number) : void
      {
         this._owner = param1;
         this.method_2029(param2,param3,param7,param4.material);
         this.name_1811 = param4.name_1811;
         this.var_2533 = 0.001 * param8;
         this.var_2453.vCopy(param5);
         this.var_2453.y += 10;
         this.turret = param6;
         this.numFrames = this.name_1811.length;
         this.name_2698 = 0;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.sprite);
      }
      
      public function get owner() : ClientObject
      {
         return this._owner;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.name_2698 + 1 >= this.numFrames)
         {
            return false;
         }
         matrix.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         matrix.name_890(this.var_2453,const_2020);
         this.sprite.x = const_2020.x;
         this.sprite.y = const_2020.y;
         this.sprite.z = const_2020.z;
         this.method_2317(this.name_1811[int(this.name_2698)]);
         this.name_2698 += this.var_2533 * param1;
         return true;
      }
      
      private function method_2317(param1:name_1773) : void
      {
         this.sprite.topLeftU = param1.topLeftU;
         this.sprite.topLeftV = param1.topLeftV;
         this.sprite.bottomRightU = param1.bottomRightU;
         this.sprite.bottomRightV = param1.bottomRightV;
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.sprite);
         this.sprite.material = null;
         this.name_1811 = null;
         method_584();
      }
      
      public function kill() : void
      {
         this.name_2698 = this.numFrames + 1;
      }
      
      override protected function getClass() : Class
      {
         return ChargeEffect;
      }
      
      private function method_2029(param1:Number, param2:Number, param3:Number, param4:TextureMaterial) : void
      {
         this.sprite.width = param1;
         this.sprite.height = param2;
         this.sprite.rotation = param3;
         this.sprite.material = param4;
      }
   }
}
