function get-pass
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true)]
        [int]
        $lenght
    )
    
    if($lenght -lt 3){$lenght =15 }
    $obj= (48..57) + (65..90) + (97..122)
    $password=$obj|Get-Random -Count $lenght|% {[char]$_}
    
    if(!((-join $password) -cmatch '^.*(?=.*\d.*\d)(?=.*[A-Z].*[A-Z]).*$')){
        get-pass $lenght
    }
    else{-join $password}
}