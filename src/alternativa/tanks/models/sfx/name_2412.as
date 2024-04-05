package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.sfx.name_657;
   import flash.geom.ColorTransform;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_2412 extends class_30 implements name_657
   {
      
      private static const const_2316:int = 1;
      
      private static const STATE_FADE:int = 2;
      
      private static var var_515:Matrix4 = new Matrix4();
      
      private static var const_2020:Vector3 = new Vector3();
       
      
      private var sprite:Sprite3D;
      
      private var var_3078:int;
      
      private var var_1411:int;
      
      private var turret:Object3D;
      
      private var var_2122:Vector3;
      
      private var time:int;
      
      private var state:int;
      
      public function name_2412(param1:ObjectPool)
      {
         this.var_2122 = new Vector3();
         super(param1);
         this.sprite = new Sprite3D(100,100);
      }
      
      public function init(param1:Material, param2:Vector3, param3:Object3D, param4:Number, param5:Number, param6:int, param7:int, param8:ColorTransform) : void
      {
         this.var_2122.vCopy(param2);
         this.var_2122.y += param4;
         this.turret = param3;
         this.var_3078 = param6;
         this.var_1411 = param7;
         this.sprite.material = param1;
         this.sprite.width = param5;
         this.sprite.height = param5;
         this.sprite.rotation = Math.random() * Math.PI * 2;
         this.sprite.colorTransform = param8;
         this.sprite.alpha = 1;
         this.state = 1;
         this.time = param6;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         switch(this.state)
         {
            case 1:
               if(this.time < 0)
               {
                  this.state = 2;
                  this.time = this.var_1411;
                  break;
               }
               this.time -= param1;
               break;
            case 2:
               if(this.time < 0)
               {
                  return false;
               }
               this.time -= param1;
               this.sprite.alpha = this.time / this.var_1411;
               break;
         }
         var_515.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         var_515.name_890(this.var_2122,const_2020);
         this.sprite.x = const_2020.x;
         this.sprite.y = const_2020.y;
         this.sprite.z = const_2020.z;
         return true;
      }
      
      public function destroy() : void
      {
         this.sprite.alternativa3d::removeFromParent();
         this.sprite.material = null;
         this.sprite.colorTransform = null;
         this.turret = null;
         method_584();
      }
      
      public function name_742(param1:name_175) : void
      {
         param1.addChild(this.sprite);
      }
      
      public function kill() : void
      {
      }
      
      override protected function getClass() : Class
      {
         return name_2412;
      }
   }
}
