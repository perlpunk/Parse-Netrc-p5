package Parse::Netrc::Grammar;

use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'share/netrc-pgx/netrc.pgx';

# Regenerate with:
# perl -Ilib -MParse::Netrc::Grammar=compile
sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'netrc',
    '+toprule' => 'netrc',
    '+version' => '0.0.1',
    'EOL' => {
      '.rgx' => qr/\G\r?\n/
    },
    '__' => {
      '.rgx' => qr/\G\s+/
    },
    'comment' => {
      '.rgx' => qr/\G\ +\#\ *(.*)/
    },
    'entry' => {
      '.any' => [
        {
          '.ref' => 'netrc_entry'
        },
        {
          '.ref' => 'macdef_entry'
        }
      ]
    },
    'macdef_body' => {
      '.all' => [
        {
          '.ref' => 'macdef_netrc'
        },
        {
          '.ref' => 'macdef_commands'
        }
      ]
    },
    'macdef_commandline' => {
      '.rgx' => qr/\G\ *(.+)/
    },
    'macdef_commands' => {
      '+max' => 1,
      '.all' => [
        {
          '.ref' => 'macdef_commandline'
        },
        {
          '+min' => 0,
          '-flat' => 1,
          '.all' => [
            {
              '.ref' => 'EOL'
            },
            {
              '.ref' => 'macdef_commandline'
            }
          ]
        },
        {
          '+max' => 1,
          '.ref' => 'EOL'
        }
      ]
    },
    'macdef_entry' => {
      '.any' => [
        {
          '.ref' => 'macdef_entry_nonempty'
        },
        {
          '.ref' => 'macdef_entry_empty'
        }
      ]
    },
    'macdef_entry_empty' => {
      '.all' => [
        {
          '.rgx' => qr/\Gmacdef\ */
        },
        {
          '+max' => 1,
          '.ref' => 'comment'
        }
      ]
    },
    'macdef_entry_nonempty' => {
      '.all' => [
        {
          '.ref' => 'macdef_header'
        },
        {
          '.ref' => 'macdef_body'
        }
      ]
    },
    'macdef_header' => {
      '.all' => [
        {
          '.rgx' => qr/\Gmacdef\ +/
        },
        {
          '.ref' => 'macdef_name'
        },
        {
          '+max' => 1,
          '.ref' => 'comment'
        },
        {
          '.ref' => 'EOL'
        }
      ]
    },
    'macdef_name' => {
      '.rgx' => qr/\G(\S+)/
    },
    'macdef_netrc' => {
      '+max' => 1,
      '.all' => [
        {
          '.ref' => 'netrc_item_comment'
        },
        {
          '+min' => 0,
          '-flat' => 1,
          '.all' => [
            {
              '.rgx' => qr/\G(?:\ +|\r?\n)/
            },
            {
              '.ref' => 'netrc_item_comment'
            }
          ]
        },
        {
          '+max' => 1,
          '.rgx' => qr/\G(?:\ +|\r?\n)/
        }
      ]
    },
    'netrc' => {
      '+max' => 1,
      '.all' => [
        {
          '.ref' => 'entry'
        },
        {
          '+min' => 0,
          '-flat' => 1,
          '.all' => [
            {
              '+min' => 1,
              '.ref' => 'EOL'
            },
            {
              '.ref' => 'entry'
            }
          ]
        },
        {
          '+max' => 1,
          '+min' => 1,
          '.ref' => 'EOL'
        }
      ]
    },
    'netrc_default_entry' => {
      '.all' => [
        {
          '.rgx' => qr/\Gdefault/
        },
        {
          '+max' => 1,
          '.ref' => 'comment'
        },
        {
          '.ref' => '__'
        },
        {
          '.all' => [
            {
              '.ref' => 'netrc_item_comment'
            },
            {
              '+min' => 0,
              '-flat' => 1,
              '.all' => [
                {
                  '.ref' => '__'
                },
                {
                  '.ref' => 'netrc_item_comment'
                }
              ]
            }
          ]
        }
      ]
    },
    'netrc_entry' => {
      '.any' => [
        {
          '.ref' => 'netrc_machine_entry'
        },
        {
          '.ref' => 'netrc_default_entry'
        }
      ]
    },
    'netrc_item' => {
      '.all' => [
        {
          '.ref' => 'netrc_item_name'
        },
        {
          '.rgx' => qr/\G\ +/
        },
        {
          '.ref' => 'netrc_value'
        }
      ]
    },
    'netrc_item_comment' => {
      '.all' => [
        {
          '.ref' => 'netrc_item'
        },
        {
          '+max' => 1,
          '.ref' => 'comment'
        }
      ]
    },
    'netrc_item_name' => {
      '.any' => [
        {
          '.ref' => 'netrc_item_name_quoted'
        },
        {
          '.ref' => 'netrc_item_name_plain'
        }
      ]
    },
    'netrc_item_name_plain' => {
      '.rgx' => qr/\G(login|account|password)/
    },
    'netrc_item_name_quoted' => {
      '.rgx' => qr/\G\"(login|account|password)\"/
    },
    'netrc_machine_entry' => {
      '.all' => [
        {
          '.rgx' => qr/\Gmachine\ +/
        },
        {
          '.ref' => 'netrc_value'
        },
        {
          '+max' => 1,
          '.ref' => 'comment'
        },
        {
          '.ref' => '__'
        },
        {
          '.all' => [
            {
              '.ref' => 'netrc_item_comment'
            },
            {
              '+min' => 0,
              '-flat' => 1,
              '.all' => [
                {
                  '.ref' => '__'
                },
                {
                  '.ref' => 'netrc_item_comment'
                }
              ]
            }
          ]
        }
      ]
    },
    'netrc_value' => {
      '.any' => [
        {
          '.ref' => 'quoted_value'
        },
        {
          '.ref' => 'plain_value'
        }
      ]
    },
    'plain_value' => {
      '.rgx' => qr/\G(\S+)/
    },
    'quoted_value' => {
      '.rgx' => qr/\G\"([^"]+)\"/
    }
  }
}

1;
