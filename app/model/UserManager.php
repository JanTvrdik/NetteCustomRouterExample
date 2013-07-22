<?php
namespace App;

use Nette;
use Twitter;


class UserManager extends BaseManager
{
	/** @var  Twitter */
	private $twitter;

	public function __construct(Nette\Database\SelectionFactory $selectionFactory, Twitter $twitter)
	{
		parent::__construct($selectionFactory);
		$this->twitter = $twitter;
	}

	public function getBySlug($slug)
	{
		return $this->selectionFactory->table('users')->where(':slugs.slug', $slug)->fetch();
	}

	public function getAll()
	{
		return $this->selectionFactory->table('users')->fetchAll();
	}

	public function getTweets($twitterNick, $count)
	{
		if ($twitterNick === NULL) return [];
		return $this->twitter->load(Twitter::ME, $count, ['screen_name' => $twitterNick]);
	}
}
