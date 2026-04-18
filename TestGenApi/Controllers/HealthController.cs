using Microsoft.AspNetCore.Mvc;

namespace TestGenApi.Controllers;

[ApiController]
[Route("[controller]")]
public class HealthController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        return Ok(new
        {
            status = "healthy",
            timestamp = DateTime.UtcNow,
            version = "0.1.0",
            service = "TestGen AI Backend"
        });
    }
}