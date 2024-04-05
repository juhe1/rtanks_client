package package_442
{
   import alternativa.tanks.vehicles.tanks.Tank;
   import mx.utils.StringUtil;
   
   public class name_2708
   {
       
      
      private var left:Number;
      
      private var right:Number;
      
      private var distance:Number;
      
      private var tank:Tank;
      
      public function name_2708(param1:Number, param2:Number, param3:Number, param4:Tank)
      {
         super();
         this.left = param1;
         this.right = param2;
         this.distance = param3;
         this.tank = param4;
      }
      
      public function method_2995() : Number
      {
         return this.left;
      }
      
      public function method_1840() : Number
      {
         return this.right;
      }
      
      public function method_1242() : Number
      {
         return this.distance;
      }
      
      public function getTank() : Tank
      {
         return this.tank;
      }
      
      public function toString() : String
      {
         return StringUtil.substitute("[{0}, {1}], distance={2}, user={3}",this.left.toFixed(2),this.right.toFixed(2),this.distance.toFixed(0),this.tank.method_484().id);
      }
   }
}
