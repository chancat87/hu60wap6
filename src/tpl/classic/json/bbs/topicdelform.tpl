{JsonPage::start()}

{if isset($tContent.content)}
    {JsonPage::_unset($tContent, 'content')}
{/if}

{$jsonData=['tMeta'=>$tMeta, 'floorMeta'=>$tContent, 'isLogin'=>$USER->islogin]}

{if $USER->islogin}
    {$jsonData.token = $token->token()}
    {$jsonData.needReason = !$selfDel}
{/if}

{if is_object($err) && $err->getMessage()}
    {$jsonData.success=false}
    {$jsonData.notice=$err->getMessage()}
{/if}

{JsonPage::output($jsonData)}
