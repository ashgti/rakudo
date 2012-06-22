class Perl6::Metamodel::PackageHOW
    does Perl6::Metamodel::Naming
    does Perl6::Metamodel::Documenting
    does Perl6::Metamodel::Stashing
    does Perl6::Metamodel::TypePretense
    does Perl6::Metamodel::MethodDelegation
{
    has $!composed;

    my $archetypes := Perl6::Metamodel::Archetypes.new( );
    method archetypes() {
        $archetypes
    }
    
    method new_type(:$name = '<anon>', :$repr, :$ver, :$auth) {
        if $repr { nqp::die("'package' does not support custom representations") }
        my $metaclass := nqp::create(self);
        my $obj := pir::repr_type_object_for__PPS($metaclass, 'Uninstantiable');
        $metaclass.set_name($obj, $name);
        self.add_stash($obj);
    }
    
    method compose($obj) {
        $!composed := 1;
    }
    
    method is_composed($obj) {
        $!composed
    }
}
