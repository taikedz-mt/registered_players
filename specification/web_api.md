# Web API

We can call a registry with the following commands and data:

## `ban`

Request:

	?action=ban&playername=PLAYERNAME

Response:

	result={'success'|'fail'}
	reason=MESSAGE

## `unban`

Request:

	?action=unban&playername=PLAYERNAME

Response:

	result={'success'|'fail'}
	reason=MESSAGE

## `isbanned`

Request:

	?action=isbanned&playername=PLAYERNAME

Response:

	known={true|false}
	banned={true|false}

## `authorize`

Request:

	?action=authorize&stoken=SERVER_TOKEN

Response:

	token=GENERATED_TOKEN

If the server token is not recognized then the response is

	error=ERROR_MESSAGE



	
