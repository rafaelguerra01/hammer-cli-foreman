module HammerCLIForeman
  module CommandExtensions
    module Hosts
      module Help
        class Interfaces < HammerCLI::CommandExtensions
          help do |h|
            h.section(_('Available keys for %{option}') % { :option => '--interface' }) do |h|
              h.list(
                [
                  'mac',
                  'ip',
                  ['type', _('Possible values: %s') % 'interface, bmc, bond, bridge'],
                  'name',
                  'subnet_id',
                  'domain_id',
                  'identifier',
                  ['managed',   'true/false'],
                  ['primary',   _('%{value}, each managed hosts needs to have one primary interface.') % {:value => 'true/false'}],
                  ['provision', 'true/false'],
                  ['virtual',   'true/false']
                ]
              )
              h.section(_('For %{condition}') % { :condition => 'virtual=true' }) do |h|
                h.list(
                  [
                    ['tag',         _('VLAN tag, this attribute has precedence over the subnet VLAN ID. Only for virtual interfaces.')],
                    ['attached_to', _('Identifier of the interface to which this interface belongs, e.g. eth1.')]
                  ]
                )
              end
              h.section(_('For %{condition}') % { :condition => 'type=bond' }) do |h|
                h.list(
                  [
                    ['mode',             _('Possible values: %s') % 'balance-rr, active-backup, balance-xor, broadcast, 802.3ad, balance-tlb, balance-alb'],
                    ['attached_devices', _('Identifiers of slave interfaces, e.g. [eth1,eth2]')],
                    'bond_options'
                  ]
                )
              end
              h.section(_('For %{condition}') % { :condition => 'type=bmc' }) do |h|
                h.list(
                  [
                    ['provider', _('always IPMI')],
                    'username',
                    'password'
                  ]
                )
              end
            end
          end
        end
      end
    end
  end
end
