<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class InitLoginController extends Controller
{
    public function show()
    {
        return response()->json([
            'data'=>response()->json(config('login_test_settings')),
            'message' => 'Configuration show successfully.',
            'status'=>200
        ],200);
    }

    public function update(Request $request)
    {
        $updatedData = $request->all();
        $configPath = config_path('login_test_settings.php');
        
        // Save the new data to the config file
        file_put_contents($configPath, '<?php return ' . var_export($updatedData, true) . ';');
        
        return response()->json([
            'data'=>$updatedData,
            'message' => 'Configuration updated successfully.',
            'status'=>200
        ],200);
    }
}