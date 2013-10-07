cookbook-composer
=================

Install composer recipes.

# Install

## Case: submodule

    $ git submodule add ${this_url} cookbooks/composer


# Usage

## Sample in roles

    name "composer"
    description "composer"
    run_list(
	    "recipe[composer]"
	)