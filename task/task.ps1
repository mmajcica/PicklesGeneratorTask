[CmdletBinding()]
param()

Trace-VstsEnteringInvocation $MyInvocation
try
{
    $featureDir = Get-VstsInput -Name featureDir -Require
    $docFormat = Get-VstsInput -Name docFormat -Require
    $sutn = Get-VstsInput -Name sutn
    $sutv = Get-VstsInput -Name sutv
    $resultsFile = Get-VstsInput -Name resultsFile
    $resultsFormat = Get-VstsInput -Name resultsFormat
    $language = Get-VstsInput -Name language
    $experimentalFeatures = Get-VstsInput -Name experimentalFeatures -Require -AsBool
    $enableComments = Get-VstsInput -Name enableComments -Require -AsBool
    $out = Get-VstsInput -Name out


    Assert-VstsPath -LiteralPath $featureDir -PathType Container

    $pickles = "$PSScriptRoot\ps_modules\Pickles-exe-2.18.0\Pickles.exe"

    if (-not $out)
    {
        if ($env:Agent_JobName -eq "Build")
        {
            $out = $env:AGENT_BUILDDIRECTORY
        }
        else
        {
            $out = $env:AGENT_RELEASEDIRECTORY
        }
    }

    $sArgs = ,"--feature-directory=""$featureDir"""
    $sArgs += "--documentation-format=$docFormat"
    $sArgs += "--output-directory=""$out"""

    if ($sutn)
    {
        $sArgs += "--system-under-test-name=$sutn"
    }

    if ($sutv)
    {
        $sArgs += "--system-under-test-version=$sutv"
    }

    if($resultsFile)
    {
        Assert-VstsPath -LiteralPath $resultsFile -PathType Leaf
        $sArgs += "--link-results-file=$resultsFile"
    }

    if ($resultsFormat)
    {
        $sArgs += "--test-results-format=$resultsFormat"
    }

    if($language)
    {
        $sArgs += "--language=$language"
    }

    if ($experimentalFeatures)
    {
        $sArgs += "--include-experimental-features"
    }

    if ($enableComments)
    {
        $sArgs += "--enableComments=true"
    }

    $sArgs = $sArgs -join " "

    Invoke-VstsTool -FileName $pickles -Arguments $sArgs -RequireExitCodeZero
}
finally
{
    Trace-VstsLeavingInvocation $MyInvocation
}
