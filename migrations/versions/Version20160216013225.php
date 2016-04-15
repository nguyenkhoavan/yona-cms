<?php

namespace Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration;
use Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
class Version20160216013225 extends AbstractMigration
{
    public function __construct(\Doctrine\DBAL\Migrations\Version $version)
    {
        parent::__construct($version);
        $this->platform->registerDoctrineTypeMapping('enum', 'string');
    }
    /**
     * @param Schema $schema
     */
    public function up(Schema $schema)
    {
        $table = $schema->createTable('migration_versions_toRemove');
        $table->addColumn('id', 'integer', array(
            'autoincrement' => true,
        ));
        $table->setPrimaryKey(array('id'));
        $this->addSql(file_get_contents(__DIR__.'/../sql/initDB.sql'));
    }

    /**
     * @param Schema $schema
     */
    public function down(Schema $schema)
    {
        // this down() migration is auto-generated, please modify it to your needs

    }
}
