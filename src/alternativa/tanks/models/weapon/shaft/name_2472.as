package alternativa.tanks.models.weapon.shaft
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Vector3;
   
   public class name_2472
   {
       
      
      public var aims:Array;
      
      public var name_2475:Vector3;
      
      public var targetHitPoint:Vector3;
      
      public function name_2472()
      {
         this.aims = new Array();
         super();
      }
      
      public function name_758(param1:Tank, param2:Vector3) : void
      {
         this.targetHitPoint = param2;
         this.aims.push(new name_2474(param1,param2));
      }
      
      public function name_2488(param1:Vector3) : void
      {
         this.name_2475 = param1.vClone();
      }
   }
}
