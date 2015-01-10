<?php
namespace App;

use Nette;
use Twitter;


class UserManager extends BaseManager
{
	/** @var  Twitter */
	private $twitter;

	public function __construct(Nette\Database\Context $db, Twitter $twitter)
	{
		parent::__construct($db);
		$this->twitter = $twitter;
	}

	public function getBySlug($slug)
	{
		return $this->db->table('users')->where(':slugs.slug', $slug)->fetch();
	}

	public function getAll()
	{
		return $this->db->table('users')->fetchAll();
	}

	public function getTweets($twitterNick, $count)
	{
		if ($twitterNick === NULL) return [];
		return $this->twitter->load(Twitter::ME, $count, ['screen_name' => $twitterNick]);
	}
}
