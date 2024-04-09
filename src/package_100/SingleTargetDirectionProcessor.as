package package_100
{
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.name_2505;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_61.RayHit;
   
   public class SingleTargetDirectionProcessor extends name_310 implements class_39
   {
       
      
      private var var_2184:name_2505;
      
      private var var_2482:RayHit;
      
      private var var_2483:Vector.<RayHit>;
      
      private var self:ClientObject;
      
      public function SingleTargetDirectionProcessor(param1:ClientObject, param2:Number)
      {
         this.var_2184 = new name_2505();
         this.var_2482 = new RayHit();
         this.var_2483 = new Vector.<RayHit>();
         super(param2,this.var_2184);
         this.self = param1;
      }
      
      override public function method_974(param1:name_903, param2:Vector3) : Vector.<RayHit>
      {
         this.var_2184.name_2506 = this.getTank(this.self) as Body;
         this.var_2482.clear();
         this.var_2483.length = 0;
         if(raycast(method_976(param1,param2),param2,this.var_2482))
         {
            this.var_2483.push(this.var_2482.clone());
         }
         return this.var_2483;
      }
      
      private function getTank(param1:ClientObject) : Tank
      {
         var _loc2_:TankModel = TankModel(OSGi.getInstance().getService(ITank));
         return _loc2_.getTankData(param1).tank;
      }
   }
}
