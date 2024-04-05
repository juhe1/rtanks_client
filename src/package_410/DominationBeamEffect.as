package package_410
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import flash.utils.Dictionary;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_242.name_662;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class DominationBeamEffect extends class_30 implements name_657
   {
      
      private static const const_2230:name_662 = new name_662("beam_zoffset",100,0,1000);
      
      private static const const_1837:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
       
      
      private var beam:AnimatedBeam;
      
      private var alive:Boolean;
      
      private var object:Object3D;
      
      private var const_1836:Vector3;
      
      private var var_2868:Dictionary;
      
      private var var_170:name_175;
      
      public function DominationBeamEffect(param1:ObjectPool)
      {
         this.const_1836 = new Vector3();
         super(param1);
         this.beam = new AnimatedBeam(1,1,1,0);
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:name_2885, param4:Dictionary) : void
      {
         this.object = param1;
         this.const_1836.vCopy(param2);
         this.beam.name_1195(param3.name_2886,param3.name_2889);
         this.beam.name_2883(param3.name_2887);
         this.beam.name_924 = param3.name_924;
         this.method_2703(param3.name_2891);
         this.beam.name_2884(param3.name_2888);
         this.beam.alpha = param3.alpha;
         this.alive = true;
         this.var_2868 = param4;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         const_1837.x = this.object.x;
         const_1837.y = this.object.y;
         const_1837.z = this.object.z + const_2230.value;
         direction.diff(this.const_1836,const_1837);
         this.beam.method_407(direction.vLength());
         direction.vNormalize();
         name_2500.name_2503(this.beam,const_1837,direction,param2.pos);
         this.beam.update(param1 * 0.001);
         return this.alive;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.beam);
         this.var_2868[this.beam] = true;
      }
      
      public function destroy() : void
      {
         this.object = null;
         this.var_170.removeChild(this.beam);
         this.beam.setMaterialToAllFaces(null);
         delete this.var_2868[this.beam];
         this.var_2868 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return DominationBeamEffect;
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function method_2703(param1:Number) : void
      {
         this.beam.name_1152(param1);
         this.beam.name_2890(param1);
      }
   }
}
