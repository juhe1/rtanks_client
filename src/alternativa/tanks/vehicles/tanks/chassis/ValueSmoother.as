package alternativa.tanks.vehicles.tanks.chassis
{
   public interface ValueSmoother
   {
       
      
      function reset(param1:Number) : void;
      
      function update(param1:Number) : Number;
      
      function setTargetValue(param1:Number) : void;
      
      function getTargetValue() : Number;
   }
}
