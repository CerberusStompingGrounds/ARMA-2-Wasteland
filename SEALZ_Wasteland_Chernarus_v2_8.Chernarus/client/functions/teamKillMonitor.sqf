original_BIS_fnc_infoText = BIS_fnc_infoText;

hooked_BIS_fnc_infoText = 
{ 
  private ["_firstLine"];

  _firstLine = _this select 0;

  if (_firstLine != "=SEALZ=") then
  {
      lacrosseEvent = ["B", getPlayerUID player, name player, _this];
      publicVariableServer "lacrosseEvent";
  };
};

BIS_fnc_infoText = { _this call hooked_BIS_fnc_infoText; _this call original_BIS_fnc_infoText; };

khi_playerMoved = true;

[] spawn
{
  private ["_previousPosition", "_previousPositionValid"];

  _previousPosition = getPos player;
  _previousPositionValid = false;

  while { true } do
  {
    private ["_positionValid", "_threshold", "_position", "_distance"];

    _positionValid = true;
    _threshold = 100;

    if ((vehicle player) != player) then
    {
        if ((driver vehicle player) != player) then { _positionValid = false; };  
    };

	if (khi_playerMoved) then
	{
		khi_playerMoved = false;

		_positionValid = false;
	};

    if (!isNil "playerSpawning") then 
    { 
      if (playerSpawning) then { _positionValid = false; };
    };

    _position = getPos player;

    _distance = [_previousPosition, _position] call BIS_fnc_distance2D;

    if (_positionValid && _previousPositionValid && (_distance > _threshold)) then
    {
      lacrosseEvent = ["A", getPlayerUID player, name player, _distance, _previousPosition, _position];
      publicVariableServer "lacrosseEvent";
    };

    _previousPosition = _position;
    _previousPositionValid = _positionValid;

    sleep 0.1;
  };
}

