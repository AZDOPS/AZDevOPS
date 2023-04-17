param(
    $PSM1 = "$PSScriptRoot\..\Source\ADOPS.psm1"
)

BeforeAll {
    Remove-Module ADOPS -Force -ErrorAction SilentlyContinue
    Import-Module $PSM1 -Force
}

Describe 'GetADOPSHeader' {
    BeforeAll {
        InModuleScope -ModuleName ADOPS {
           
        }
    }

    Context 'Parameters' {
        $TestCases = @(
            @{
                Name = 'Organization'
                Mandatory = $false
                Type = 'string'
            }
        )

        It 'Should have parameter <_.Name>' -TestCases $TestCases  {
            Get-Command GetADOPSHeader | Should -HaveParameter $_.Name -Mandatory:$_.Mandatory -Type $_.Type
        }
    }

    Context '' {
        it '' {
            InModuleScope -ModuleName ADOPS {
                {throw} | Should -not -Throw
            }
        }
    }
}

