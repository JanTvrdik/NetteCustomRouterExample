<?php
namespace App;

use Nette;


class SlugManager extends BaseManager
{
	public function getBySlug($slug)
	{
		return $this->selectionFactory->table('slugs')->wherePrimary($slug)->fetch();
	}
}
